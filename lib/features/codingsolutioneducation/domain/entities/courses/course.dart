import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/entities/courses/timetable.dart';
import 'package:equatable/equatable.dart';

import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/entities/courses/mentor.dart';

class Courses extends Equatable {
  final List<Course> courses;

  const Courses(this.courses);

  @override
  List<Object?> get props => [];
}

class Course extends Equatable {
  final String? imageUrl;
  final String? title;
  final String? metadata1;
  final String? metadata2;
  final List<String>? syllabus;
  final Timetable? timetable;
  final List<Mentor>? mentors;

  const Course({
    this.imageUrl,
    this.title,
    this.metadata1,
    this.metadata2,
    this.syllabus,
    this.timetable,
    this.mentors,
  });

  @override
  List<Object?> get props =>
      [imageUrl, title, metadata1, metadata2, syllabus, timetable, mentors];
}
