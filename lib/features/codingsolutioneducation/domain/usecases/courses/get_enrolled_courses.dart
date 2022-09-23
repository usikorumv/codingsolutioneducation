import 'package:dartz/dartz.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';

class GetEnrolledCourses extends UseCase<Courses, EnrolledCoursesParams> {
  final CoursesRepository _repo;

  GetEnrolledCourses(this._repo);

  @override
  Future<Either<Failure, Courses>> call(EnrolledCoursesParams params) =>
      _repo.enrolledCourses(params);
}

class EnrolledCoursesParams {
  final String? id;

  EnrolledCoursesParams(this.id);

  Map<String, dynamic> toJson() => {};
}
