import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_courses.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit(this._getCourses) : super(CoursesInitial());

  final GetCourses _getCourses;

  Future<void> courses(CoursesParams params) async {
    emit(CoursesLoading());

    final data = await _getCourses.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(CoursesFailure(message: l.message));
        }
        if (l is NoDataFailure) {
          emit(CoursesEmpty());
        }
      },
      (r) {
        emit(CoursesSuccess(courses: r));
      },
    );
  }
}
