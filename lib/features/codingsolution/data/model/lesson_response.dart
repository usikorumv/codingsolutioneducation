import 'dart:convert';

import 'package:codingsolution/features/codingsolution/domain/entities/courses/courses.dart';

class LessonResponse {
  final String title;
  final String description;
  final String mdUrl;
  final String videoUrl;
  LessonResponse({
    required this.title,
    required this.description,
    required this.mdUrl,
    required this.videoUrl,
  });

  LessonResponse copyWith({
    String? title,
    String? description,
    String? mdUrl,
    String? videoUrl,
  }) {
    return LessonResponse(
      title: title ?? this.title,
      description: description ?? this.description,
      mdUrl: mdUrl ?? this.mdUrl,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'mdUrl': mdUrl});
    result.addAll({'videoUrl': videoUrl});

    return result;
  }

  factory LessonResponse.fromMap(Map<String, dynamic> map) {
    return LessonResponse(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      mdUrl: map['mdUrl'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonResponse.fromJson(String source) =>
      LessonResponse.fromMap(json.decode(source));

  Lesson toEntity() => Lesson(
        title,
        description,
        mdUrl,
        videoUrl,
      );

  @override
  String toString() {
    return 'LessonResponse(title: $title, description: $description, mdUrl: $mdUrl, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LessonResponse &&
        other.title == title &&
        other.description == description &&
        other.mdUrl == mdUrl &&
        other.videoUrl == videoUrl;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        mdUrl.hashCode ^
        videoUrl.hashCode;
  }
}
