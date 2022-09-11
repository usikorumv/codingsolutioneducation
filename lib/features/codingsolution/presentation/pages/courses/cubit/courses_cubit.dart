import 'package:bloc/bloc.dart';
import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';
import 'package:codingsolution/features/codingsolution/domain/usecases/courses/get_courses.dart';
import 'package:codingsolution/features/codingsolution/domain/usecases/courses/post_register_course.dart';
import 'package:codingsolution/service_locator.dart';
import 'package:equatable/equatable.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit(this._getCourses) : super(CoursesInitial());

  final GetCourses _getCourses;

  Future<void> course(CoursesParams params) async {
    emit(CoursesLoading());

    final data = await _getCourses.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(CoursesFailure(message: l.message));
        }
      },
      (r) {
        emit(CoursesSuccess(courses: r));
      },
    );
  }
}
