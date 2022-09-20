import 'package:equatable/equatable.dart';

class Timetable extends Equatable {
  final String? title;
  final List<Syllabuses>? syllabuses;

  const Timetable(this.title, this.syllabuses);

  @override
  List<Object?> get props => [];
}

class Syllabuses extends Equatable {
  final String? title;
  final List<Syllabus>? syllabus;

  const Syllabuses(this.title, this.syllabus);

  @override
  List<Object?> get props => [];
}

class Syllabus extends Equatable {
  final String? title;
  final List<String>? descriptions;

  const Syllabus(this.title, this.descriptions);

  @override
  List<Object?> get props => [];
}
