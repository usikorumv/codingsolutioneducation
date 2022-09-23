import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? email;
  final String? name;
  final String? surname;
  final String? referer;
  final String? phone;
  final String? date;

  const User({
    this.email,
    this.name,
    this.surname,
    this.referer,
    this.phone,
    this.date,
  });

  @override
  List<Object?> get props => [];
}
