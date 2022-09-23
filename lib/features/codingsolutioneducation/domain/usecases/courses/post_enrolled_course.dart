import 'package:dartz/dartz.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';

class PostEnrolledCourses extends UseCase<bool, PostEnrolledCoursesParams> {
  final CoursesRepository _repo;

  PostEnrolledCourses(this._repo);

  @override
  Future<Either<Failure, bool>> call(
          PostEnrolledCoursesParams postEnrolledCoursesParams) =>
      _repo.addEnrolledCourses(
          postEnrolledCoursesParams.userId, postEnrolledCoursesParams.courseId);
}

class PostEnrolledCoursesParams {
  final String userId;
  final String courseId;

  PostEnrolledCoursesParams({required this.userId, required this.courseId});
}
