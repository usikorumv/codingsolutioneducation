import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/codingsolution/data/data.dart';
import 'features/codingsolution/domain/domain.dart';
import 'features/codingsolution/presentation/pages/auth/cubit/cubit.dart';

final sl = GetIt.instance;

init() {
  sl.registerSingleton<DioClient>(DioClient());

  dataSources();
  repositories();
  useCase();
  cubit();
}

void initPreferencesManager(SharedPreferences initPreferencesManager) {
  sl.registerLazySingleton<AuthLocalDataSource>(() =>
      CodingSolutionAuthLocalDataSourceImpl(
          preferences: initPreferencesManager));
}

void dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => CodingSolutionAuthRemoteDatasourceImpl(sl()),
  );
}

void repositories() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
}

void useCase() {
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));
}

void cubit() {
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => LoginCubit(sl()));
}
