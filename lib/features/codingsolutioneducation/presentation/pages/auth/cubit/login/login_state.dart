part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final Login? login;

  LoginSuccess({this.login});

  @override
  List<Object?> get props => [login];
}

class LoginFailure extends LoginState {
  final String? message;

  LoginFailure({this.message});

  @override
  List<Object?> get props => [message];
}
