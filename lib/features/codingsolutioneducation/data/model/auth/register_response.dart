import 'package:equatable/equatable.dart';

import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';

class RegisterResponse extends Equatable {
  final String message;

  const RegisterResponse({required this.message});

  const RegisterResponse.fromJson(dynamic json) : message = json;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;

    return map;
  }

  Register toEntity() => Register(message);

  @override
  List<Object?> get props => [message];
}
