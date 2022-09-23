import 'package:bloc/bloc.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/entities/entities.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_enrolled_courses.dart';
import 'package:equatable/equatable.dart';

part 'enrolled_courses_state.dart';

class EnrolledCoursesCubit extends Cubit<EnrolledCoursesState> {
  EnrolledCoursesCubit(this._getCourses) : super(EnrolledCoursesInitial());

  final GetEnrolledCourses _getCourses;

  Future<void> courses(EnrolledCoursesParams params) async {
    emit(EnrolledCoursesLoading());

    final data = await _getCourses.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(EnrolledCoursesFailure(message: l.message));
        }
        if (l is NoDataFailure) {
          emit(EnrolledCoursesEmpty());
        }
      },
      (r) {
        emit(EnrolledCoursesSuccess(courses: r));
      },
    );
  }
}
