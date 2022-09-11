import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/data/data.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';
import 'package:codingsolution/service_locator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._postLogin) : super(LoginInitial());

  final PostLogin _postLogin;

  Future<void> login(LoginParams params) async {
    emit(LoginLoading());
    final data = await _postLogin.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(LoginFailure(message: l.message));
        }
      },
      (r) {
        /// Set isAuth true
        sl<AuthLocalDataSource>().isLoggedIn = true;
        sl<AuthLocalDataSource>().token = r.token;
        emit(LoginSuccess(login: r));
      },
    );
  }

  Future<void> logout() async {
    emit(LoginLoading());
    sl<AuthLocalDataSource>().logout();
    emit(LoginSuccess());
  }
}
