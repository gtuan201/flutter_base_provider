import 'package:dio/dio.dart';

abstract class BaseApiService {
  // prod:  http://
  // dev: http://
  static get baseUrl => "http://";

  final Dio dio = Dio();

  Future<dynamic> get({required String url});
  Future<dynamic> post({required String url, dynamic data});
  Future<dynamic> put({required String url, dynamic data});
  Future<dynamic> delete({required String url});
}
