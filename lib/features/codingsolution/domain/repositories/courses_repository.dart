import 'package:codingsolution/features/codingsolution/domain/usecases/courses/get_courses.dart';
import 'package:dartz/dartz.dart';
import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';

import '../usecases/courses/post_register_course.dart';

abstract class CoursesRepository {
  Future<Either<Failure, Courses>> courses(CoursesParams coursesParams);

  Future<Either<Failure, bool>> courseRegister(
      RegisterCourseParams coursesParams);
}
