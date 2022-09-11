import 'package:codingsolution/features/codingsolution/domain/entities/courses/courses.dart';
import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String imageUrl, title;
  final List<Lesson>? lessons;

  const Course(this.imageUrl, this.title, this.lessons);

  @override
  List<Object> get props => [];
}

class Courses extends Equatable {
  final List<Course> courses;

  Courses(this.courses);

  @override
  List<Object> get props => [];
}
