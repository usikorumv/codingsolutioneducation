import 'package:codingsolution/features/codingsolution/domain/entities/courses/mentor.dart';
import 'package:codingsolution/features/codingsolution/domain/entities/courses/timetable.dart';
import 'package:equatable/equatable.dart';

import 'package:codingsolution/features/codingsolution/domain/domain.dart';
import 'package:codingsolution/features/codingsolution/domain/entities/courses/courses.dart';

class CoursesResponse extends Equatable {
  final List<DataCourse>? data;

  const CoursesResponse({this.data});

  factory CoursesResponse.fromJson(dynamic source) {
    final coursesTemp = source as List<dynamic>?;
    final courses = coursesTemp != null
        ? coursesTemp.map((c) => DataCourse.fromJson(c)).toList()
        : <DataCourse>[];

    return CoursesResponse(data: courses);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    return map;
  }

  Courses toEntity() {
    final listCourse = data!
        .map<Course>(
          (model) => Course(
            imageUrl: model.imageUrl,
            title: model.title,
            metadata1: model.metadata1,
            metadata2: model.metadata2,
            syllabus: model.syllabus,
            timetable: model.timetable?.toEntity(),
            mentors: model.mentors!
                .map<Mentor>(
                  (m) => m.toEntity(),
                )
                .toList(),
          ),
        )
        .toList();

    return Courses(listCourse);
  }

  @override
  List<Object?> get props => [data];
}

class DataCourse extends Equatable {
  final String? imageUrl;
  final String? title;
  final String? metadata1;
  final String? metadata2;
  final List<String>? syllabus;
  final DataTimetable? timetable;
  final List<DataMentor>? mentors;

  const DataCourse({
    this.imageUrl,
    this.title,
    this.metadata1,
    this.metadata2,
    this.syllabus,
    this.timetable,
    this.mentors,
  });

  factory DataCourse.fromJson(dynamic json) {
    final imageUrl = json["image_url"];
    final title = json["title"];
    final metadata1 = json["metadata_1"];
    final metadata2 = json["metadata_2"];
    final syllabusTemp = json["syllabus"] as List<dynamic>?;
    final syllabus = syllabusTemp != null
        ? syllabusTemp.map((s) => s.toString()).toList()
        : <String>[];
    final timetable = json["timetable"] != null
        ? DataTimetable.fromJson(json["timetable"])
        : null;
    final mentorsTemp = json["mentors"] as List<dynamic>?;
    final mentors = mentorsTemp != null
        ? mentorsTemp.map((m) => DataMentor.fromJson(m)).toList()
        : <DataMentor>[];

    return DataCourse(
      imageUrl: imageUrl,
      title: title,
      metadata1: metadata1,
      metadata2: metadata2,
      syllabus: syllabus,
      timetable: timetable,
      mentors: mentors,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    return map;
  }

  @override
  List<Object?> get props => [];
}

class DataMentor extends Equatable {
  final String? imageUrl;
  final String? title;
  final String? description;

  DataMentor.fromJson(dynamic json)
      : imageUrl = json["image_url"],
        title = json["title"],
        description = json["description"];

  const DataMentor({this.imageUrl, this.title, this.description});

  Mentor toEntity() => Mentor(imageUrl, title, description);

  @override
  List<Object?> get props => [imageUrl, title, description];
}

class DataTimetable extends Equatable {
  final String? title;
  final List<DataSyllabuses>? syllabuses;

  factory DataTimetable.fromJson(dynamic json) {
    final title = json["title"];
    final syllabusesTemp = json["syllabuses"] as List<dynamic>?;
    final syllabuses = syllabusesTemp != null
        ? syllabusesTemp.map((ss) => DataSyllabuses.fromJson(ss)).toList()
        : <DataSyllabuses>[];

    return DataTimetable(title: title, syllabuses: syllabuses);
  }

  const DataTimetable({this.title, this.syllabuses});

  Timetable toEntity() => Timetable(
        title,
        syllabuses != null
            ? syllabuses!.map((ss) => ss.toEntity()).toList()
            : null,
      );

  @override
  List<Object?> get props => [];
}

class DataSyllabuses extends Equatable {
  final String? title;
  final List<DataSyllabus>? syllabus;

  const DataSyllabuses({this.title, this.syllabus});

  factory DataSyllabuses.fromJson(dynamic json) {
    final title = json["title"];
    final syllabusTemp = json["syllabus"] as List<dynamic>?;
    final syllabus = syllabusTemp != null
        ? syllabusTemp.map((ss) => DataSyllabus.fromJson(ss)).toList()
        : <DataSyllabus>[];

    return DataSyllabuses(title: title, syllabus: syllabus);
  }

  Syllabuses toEntity() => Syllabuses(
        title,
        syllabus != null ? syllabus!.map((s) => s.toEntity()).toList() : null,
      );

  @override
  List<Object?> get props => [];
}

class DataSyllabus extends Equatable {
  final String? title;
  final List<String>? descriptions;

  const DataSyllabus({this.title, this.descriptions});

  factory DataSyllabus.fromJson(dynamic json) {
    final title = json["title"];
    final descriptionsTemp = json["descriptions"] as List<dynamic>?;
    final descriptions = descriptionsTemp != null
        ? descriptionsTemp.map((s) => s.toString()).toList()
        : <String>[];

    return DataSyllabus(title: title, descriptions: descriptions);
  }

  Syllabus toEntity() => Syllabus(title, descriptions);

  @override
  List<Object?> get props => [];
}
