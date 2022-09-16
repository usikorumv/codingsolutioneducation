import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final String message;

  const UserInfo(this.message);

  @override
  List<Object?> get props => [message];
}
