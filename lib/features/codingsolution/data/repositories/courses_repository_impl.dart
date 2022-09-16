import 'package:codingsolution/features/codingsolution/data/data_sources/remote/courses_remote_data_source.dart';
import 'package:codingsolution/features/codingsolution/domain/usecases/courses/get_courses.dart';
import 'package:dartz/dartz.dart';
import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';

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
}
