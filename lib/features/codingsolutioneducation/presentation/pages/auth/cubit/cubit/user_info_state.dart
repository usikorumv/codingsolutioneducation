part of 'user_info_cubit.dart';

abstract class UserInfoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoSuccess extends UserInfoState {
  final UserInfo? userInfo;

  UserInfoSuccess({this.userInfo});

  @override
  List<Object?> get props => [userInfo];
}

class UserInfoFailure extends UserInfoState {
  final String? message;

  UserInfoFailure({this.message});

  @override
  List<Object?> get props => [message];
}
