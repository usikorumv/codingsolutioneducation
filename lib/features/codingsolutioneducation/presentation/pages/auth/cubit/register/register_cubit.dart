import 'package:codingsolutioneducation/features/codingsolutioneducation/data/data_sources/data_sources.dart';
import 'package:codingsolutioneducation/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final PostRegister _postRegister;

  RegisterCubit(this._postRegister) : super(RegisterInitial());

  Future<void> register(RegisterParams params) async {
    emit(RegisterLoading());
    final data = await _postRegister.call(params);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(
            RegisterFailure(message: l.message),
          );
        }
      },
      (r) {
        sl<AuthLocalDataSource>().isRegistered = true;
        emit(RegisterSuccess(register: r));
      },
    );
  }
}
