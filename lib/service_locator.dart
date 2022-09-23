import 'package:codingsolutioneducation/features/codingsolutioneducation/data/data_sources/remote/courses_remote_data_source.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/auth/get_user.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/auth/post_user_info.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_courses.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_enrolled_courses.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/post_enrolled_course.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/auth/cubit/cubit/user_info_cubit.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/courses/cubit/courses/courses_cubit.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/courses/cubit/enrolled_courses/enrolled_courses_add_cubit.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/enrolled_courses/cubit/enrolled_courses_cubit.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/profile_page/cubit/user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/codingsolutioneducation/data/data.dart';
import 'features/codingsolutioneducation/domain/domain.dart';
import 'features/codingsolutioneducation/presentation/pages/auth/cubit/cubit.dart';

final sl = GetIt.instance;

init() {
  dataSources();
  repositories();
  useCase();
  cubit();
}

void initPreferencesManager(SharedPreferences initPreferencesManager) {
  sl.registerLazySingleton<AuthLocalDataSource>(() =>
      FirebaseAuthLocalDataSourceImpl(preferences: initPreferencesManager));
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
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => GetCourses(sl()));
  sl.registerLazySingleton(() => PostEnrolledCourses(sl()));
  sl.registerLazySingleton(() => GetEnrolledCourses(sl()));
}

void cubit() {
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => UserInfoCubit(sl()));
  sl.registerFactory(() => UserCubit(sl()));
  sl.registerFactory(() => CoursesCubit(sl()));
  sl.registerFactory(() => EnrolledCoursesAddCubit(sl()));
  sl.registerFactory(() => EnrolledCoursesCubit(sl()));
}
