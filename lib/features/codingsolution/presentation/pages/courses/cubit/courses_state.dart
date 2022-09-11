part of 'courses_cubit.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

class CoursesInitial extends CoursesState {}

class CoursesLoading extends CoursesState {}

class CoursesSuccess extends CoursesState {
  final Courses? courses;

  CoursesSuccess({this.courses});
}

class CoursesFailure extends CoursesState {
  final String? message;

  CoursesFailure({this.message});
}
