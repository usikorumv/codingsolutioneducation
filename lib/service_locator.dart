import 'package:codingsolution/features/codingsolution/data/data_sources/remote/courses_remote_data_source.dart';
import 'package:codingsolution/features/codingsolution/domain/usecases/auth/post_user_info.dart';
import 'package:codingsolution/features/codingsolution/domain/usecases/courses/get_courses.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/auth/cubit/cubit/user_info_cubit.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/courses/cubit/courses_cubit.dart';
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
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(preferences: initPreferencesManager));
}

void dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => FirebaseAuthRemoteDatasourceImpl(),
  );
  sl.registerLazySingleton<CoursesRemoteDatasource>(
    () => FirebaseCoursesRemoteDatasource(),
  );
}

void repositories() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<CoursesRepository>(
      () => CoursesRepositoryImpl(sl()));
}

void useCase() {
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));
  sl.registerLazySingleton(() => PostUserInfo(sl()));

  sl.registerLazySingleton(() => GetCourses(sl()));
}

void cubit() {
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => UserInfoCubit(sl()));

  sl.registerFactory(() => CoursesCubit(sl()));
}
