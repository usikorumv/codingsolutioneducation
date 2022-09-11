import 'package:dartz/dartz.dart';
import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';

class PostRegisterCourse extends UseCase<bool, RegisterCourseParams> {
  final CoursesRepository _repo;

  PostRegisterCourse(this._repo);

  @override
  Future<Either<Failure, bool>> call(RegisterCourseParams params) =>
      _repo.courseRegister(params);
}

class RegisterCourseParams {
  final int id;

  RegisterCourseParams(this.id);

  Map<String, dynamic> toJson() => {
        "course": id,
      };
}
