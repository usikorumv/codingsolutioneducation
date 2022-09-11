part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final Register? register;

  RegisterSuccess({this.register});

  @override
  List<Object?> get props => [register];
}

class RegisterFailure extends RegisterState {
  final String? message;

  RegisterFailure({this.message});

  @override
  List<Object?> get props => [message];
}
