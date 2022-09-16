import 'package:codingsolution/features/codingsolution/domain/usecases/courses/get_courses.dart';
import 'package:dartz/dartz.dart';
import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';

abstract class CoursesRepository {
  Future<Either<Failure, Courses>> courses(CoursesParams coursesParams);
}
