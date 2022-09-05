import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:codingsolution/core/error/failure.dart';
import 'package:codingsolution/features/codingsolution/data/data.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';
import 'package:codingsolution/locator_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._postLogin) : super(const LoginState());

  final PostLogin _postLogin;

  Future<void> login(LoginParams params) async {
    emit(state.copyWith(status: LoginStatus.loading));
    final data = await _postLogin.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(state.copyWith(status: LoginStatus.failure, message: l.message));
        }
      },
      (r) {
        sl<AuthLocalDataSource>().isLoggedIn = true;
        sl<AuthLocalDataSource>().token = r.token;
        emit(state.copyWith(status: LoginStatus.success, login: r));
      },
    );
  }

  Future<void> logout() async {
    emit(state.copyWith(status: LoginStatus.loading));
    sl<AuthLocalDataSource>().logout();
    emit(state.copyWith(status: LoginStatus.success));
  }
}
