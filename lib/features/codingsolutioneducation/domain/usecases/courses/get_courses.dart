import 'package:dartz/dartz.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';

class GetCourses extends UseCase<Courses, CoursesParams> {
  final CoursesRepository _repo;

  GetCourses(this._repo);

  @override
  Future<Either<Failure, Courses>> call(CoursesParams params) =>
      _repo.courses(params);
}

class CoursesParams {
  Map<String, dynamic> toJson() => {};
}
