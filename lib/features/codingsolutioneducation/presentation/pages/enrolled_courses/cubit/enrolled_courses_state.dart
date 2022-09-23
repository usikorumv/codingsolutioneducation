part of 'enrolled_courses_cubit.dart';

abstract class EnrolledCoursesState extends Equatable {
  const EnrolledCoursesState();

  @override
  List<Object> get props => [];
}

class EnrolledCoursesInitial extends EnrolledCoursesState {}

class EnrolledCoursesLoading extends EnrolledCoursesState {}

class EnrolledCoursesSuccess extends EnrolledCoursesState {
  final Courses? courses;

  const EnrolledCoursesSuccess({this.courses});
}

class EnrolledCoursesFailure extends EnrolledCoursesState {
  final String? message;

  const EnrolledCoursesFailure({this.message});
}

class EnrolledCoursesEmpty extends EnrolledCoursesState {}
