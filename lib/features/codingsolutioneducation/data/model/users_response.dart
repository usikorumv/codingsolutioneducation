import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/entities/auth/users.dart';
import 'package:equatable/equatable.dart';

class UserResponse extends Equatable {
  const UserResponse({
    this.email,
    this.name,
    this.surname,
    this.referer,
    this.phone,
    this.date,
  });

  final String? email;
  final String? name;
  final String? surname;
  final String? referer;
  final String? phone;
  final String? date;

  User toEntity() => User(
        email: email,
        name: name,
        surname: surname,
        referer: referer,
        phone: phone,
        date: date,
      );

  factory UserResponse.fromJson(dynamic json) {
    final email = json["email"];
    final name = json["name"];
    final surname = json["surname"];
    final referer = json["referer"];
    final phone = json["phone"];
    final date = json["date"];

    return UserResponse(
      email: email,
      name: name,
      surname: surname,
      referer: referer,
      phone: phone,
      date: date,
    );
  }

  @override
  List<Object?> get props => [];
}
