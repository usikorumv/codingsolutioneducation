import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:codingsolution/features/codingsolution/domain/domain.dart';
import 'package:codingsolution/features/codingsolution/domain/entities/courses/courses.dart';

class CoursesResponse extends Equatable {
  final List<Course> courses;
  CoursesResponse({
    required this.courses,
  });

  CoursesResponse copyWith({
    List<Course>? courses,
  }) {
    return CoursesResponse(
      courses: courses ?? this.courses,
    );
  }

  Courses toEntity() => Courses(courses);

  factory CoursesResponse.fromJson(dynamic source) {
    final List<dynamic> courses = source;
    final List<Course> converted = [];

    for (dynamic e in courses) {
      converted.add(
        Course(
          e["course_image"],
          e["name"],
          null,
        ),
      );
    }

    return CoursesResponse(courses: converted);
  }

  @override
  String toString() => 'CoursesResponse(courses: $courses)';

  @override
  List<Object> get props => [courses];
}
