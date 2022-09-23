import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_courses.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_enrolled_courses.dart';
import 'package:dartz/dartz.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';

abstract class CoursesRepository {
  Future<Either<Failure, Courses>> courses(CoursesParams coursesParams);

  Future<Either<Failure, Courses>> enrolledCourses(
      EnrolledCoursesParams coursesParams);

  Future<Either<Failure, bool>> addEnrolledCourses(
      String userId, String courseId);
}
