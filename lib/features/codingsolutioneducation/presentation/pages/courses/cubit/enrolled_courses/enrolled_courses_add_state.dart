part of 'enrolled_courses_add_cubit.dart';

abstract class EnrolledCoursesAddState extends Equatable {
  const EnrolledCoursesAddState();

  @override
  List<Object> get props => [];
}

class EnrolledCoursesAddInitial extends EnrolledCoursesAddState {}

class EnrolledCourseAddFailure extends EnrolledCoursesAddState {}

class EnrolledCourseAdding extends EnrolledCoursesAddState {}

class EnrolledCourseAdded extends EnrolledCoursesAddState {
  final bool success;

  const EnrolledCourseAdded({required this.success});
}
