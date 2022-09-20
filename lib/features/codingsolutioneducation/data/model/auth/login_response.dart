import 'package:equatable/equatable.dart';

import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';

class LoginResponse extends Equatable {
  final String? token;
  final String? error;

  const LoginResponse({this.token, this.error});

  LoginResponse.fromJson(dynamic json)
      : token = json['access'] as String?,
        error = json['error'] as String?;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access'] = token;
    map['error'] = error;

    return map;
  }

  Login toEntity() => Login(token);

  @override
  List<Object?> get props => [
        token,
        error,
      ];
}
