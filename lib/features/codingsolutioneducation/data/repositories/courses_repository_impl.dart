import 'package:codingsolutioneducation/features/codingsolutioneducation/data/data_sources/remote/courses_remote_data_source.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_courses.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_enrolled_courses.dart';
import 'package:dartz/dartz.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  /// Data Source
  final CoursesRemoteDatasource _coursesRemoteDatasource;

  const CoursesRepositoryImpl(this._coursesRemoteDatasource);

  @override
  Future<Either<Failure, Courses>> courses(CoursesParams coursesParams) async {
    try {
      final response = await _coursesRemoteDatasource.courses(coursesParams);

      /// Throw error when data is empty
      if (response.data?.isEmpty ?? true) {
        return Left(NoDataFailure());
      }

      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Courses>> enrolledCourses(
      EnrolledCoursesParams enrollCoursesParams) async {
    try {
      final response =
          await _coursesRemoteDatasource.enrolledCourses(enrollCoursesParams);

      /// Throw error when data is empty
      if (response.data?.isEmpty ?? true) {
        return Left(NoDataFailure());
      }

      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> addEnrolledCourses(
      String userId, String courseId) async {
    try {
      final response =
          await _coursesRemoteDatasource.addEnrolledCourse(userId, courseId);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
