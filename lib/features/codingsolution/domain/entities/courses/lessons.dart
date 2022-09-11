import 'package:equatable/equatable.dart';

class Lesson extends Equatable {
  final String title, description, mdUrl, videoUrl;

  const Lesson(this.title, this.description, this.mdUrl, this.videoUrl);

  @override
  List<Object?> get props => [title, description, mdUrl, videoUrl];
}
