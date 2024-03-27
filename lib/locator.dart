import 'package:get_it/get_it.dart';

import 'repository/auth_repository.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}
