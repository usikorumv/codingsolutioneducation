import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/entities/auth/user_info.dart';
import 'package:dartz/dartz.dart';

class PostUserInfo extends UseCase<UserInfo, UserInfoParams> {
  final AuthRepository _repo;

  PostUserInfo(this._repo);

  @override
  Future<Either<Failure, UserInfo>> call(UserInfoParams params) =>
      _repo.userInfo(params);
}

class UserInfoParams {
  final String name, surname, phone, referer;

  UserInfoParams({
    required this.name,
    required this.surname,
    required this.phone,
    required this.referer,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "phone": phone,
      "referer": referer,
    };
  }
}
