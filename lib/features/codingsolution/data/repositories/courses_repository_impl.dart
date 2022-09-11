import 'package:codingsolution/features/codingsolution/data/data_sources/remote/courses_remote_data_source.dart';
import 'package:codingsolution/features/codingsolution/domain/usecases/courses/get_courses.dart';
import 'package:codingsolution/features/codingsolution/domain/usecases/courses/post_register_course.dart';
import 'package:dartz/dartz.dart';
import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/data/data.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  /// Data Source
  final CoursesRemoteDatasource coursesRemoteDatasource;

  const CoursesRepositoryImpl(this.coursesRemoteDatasource);

  @override
  Future<Either<Failure, Courses>> courses(CoursesParams coursesParams) async {
    try {
      final response = await coursesRemoteDatasource.courses(coursesParams);

      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> courseRegister(
    RegisterCourseParams registerCourseParams,
  ) async {
    try {
      final response =
          await coursesRemoteDatasource.courseRegister(registerCourseParams);

      // TODO: Instead of bool use Response
      return const Right(true);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
