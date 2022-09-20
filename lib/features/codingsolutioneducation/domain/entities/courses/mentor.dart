import 'package:equatable/equatable.dart';

class Mentor extends Equatable {
  final String? imageUrl;
  final String? title;
  final String? description;

  const Mentor(
    this.imageUrl,
    this.title,
    this.description,
  );

  @override
  List<Object?> get props => [imageUrl, title, description];
}
