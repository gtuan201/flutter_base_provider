import '../data/remote/api_endpoint.dart';
import '../models/auth_model.dart';
import '../services/network_api_service.dart';
import '../services/shared_pref_service.dart';
import '../utils/log_utils.dart';

abstract class AuthRepository {
  Future<AuthModel> login({required String username, required String password});

  Future<dynamic> refreshToken({
    required String accessToken,
    required String refreshToken,
  });

  Future<bool> isUserLoggedIn() async {
    try {
      if (SharedPrefService.instance.userToken == null ||
          SharedPrefService.instance.userToken!.isEmpty) {
        LogUtils.d("No login token found!");

        return false;
      }

      /// get new token
      final AuthModel response = await refreshToken(
        accessToken: SharedPrefService.instance.userToken!,
        refreshToken: SharedPrefService.instance.userRefreshToken!,
      );

      LogUtils.d("new token: ${response.accessToken}");
      await saveLoginToken(response);
      return true;
    } catch (e) {
      LogUtils.d("renewal failed!");
      return false;
    }
  }

  Future<void> saveLoginToken(AuthModel authToken) async {
    await SharedPrefService.instance
        .setUserToken(userToken: authToken.accessToken);
    await SharedPrefService.instance
        .setUserRefreshToken(userRefreshToken: authToken.refreshToken);
  }

  Future<void> logOut();
}

class AuthRepositoryImpl extends AuthRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  @override
  Future<AuthModel> login(
      {required String username, required String password}) async {
    Map<String, String> data = {
      "username": username,
      "password": password,
    };

    try {
      dynamic response =
          await _apiServices.post(url: ApiEndPoint.login, data: data);
      return AuthModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future refreshToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    Map<String, String> data = {
      "accessToken": accessToken,
      "refreshToken": refreshToken,
    };

    try {
      dynamic response =
          await _apiServices.post(url: ApiEndPoint.login, data: data);

      return AuthModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOut() {
    throw UnimplementedError();
  }
}
