import 'package:bloc/bloc.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/post_enrolled_course.dart';
import 'package:equatable/equatable.dart';

part 'enrolled_courses_add_state.dart';

class EnrolledCoursesAddCubit extends Cubit<EnrolledCoursesAddState> {
  EnrolledCoursesAddCubit(this._postEnrolledCourses)
      : super(EnrolledCoursesAddInitial());

  final PostEnrolledCourses _postEnrolledCourses;

  Future<void> enrolledCourse(PostEnrolledCoursesParams params) async {
    emit(EnrolledCourseAdding());

    final data = await _postEnrolledCourses.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(EnrolledCourseAddFailure());
        }
      },
      (r) {
        emit(EnrolledCourseAdded(success: r));
      },
    );
  }
}
