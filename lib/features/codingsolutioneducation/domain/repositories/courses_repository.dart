import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_courses.dart';
import 'package:dartz/dartz.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';

abstract class CoursesRepository {
  Future<Either<Failure, Courses>> courses(CoursesParams coursesParams);
}
