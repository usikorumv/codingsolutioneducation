import 'package:bloc/bloc.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/entities/auth/users.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/auth/get_user.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._getCourses) : super(UserInitial());

  final GetUser _getCourses;

  Future<void> user(UserParams params) async {
    emit(UserLoading());

    final data = await _getCourses.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(UserFailure(message: l.message));
        }
      },
      (r) {
        emit(UserSuccess(user: r));
      },
    );
  }
}
