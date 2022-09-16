import 'package:codingsolution/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:codingsolution/core/error/failure.dart';
import 'package:codingsolution/features/codingsolution/data/data_sources/local/auth_local_data_source.dart';
import 'package:codingsolution/features/codingsolution/domain/entities/auth/user_info.dart';
import 'package:codingsolution/features/codingsolution/domain/usecases/auth/post_user_info.dart';
import 'package:equatable/equatable.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit(this._postUserInfo) : super(UserInfoInitial());

  final PostUserInfo _postUserInfo;

  Future<void> userInfo(UserInfoParams params) async {
    emit(UserInfoLoading());
    final data = await _postUserInfo.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(UserInfoFailure(message: l.message));
        }
      },
      (r) {
        sl<AuthLocalDataSource>().isRegistered = false;
        emit(UserInfoSuccess(userInfo: r));
      },
    );
  }
}
