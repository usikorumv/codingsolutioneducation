import 'package:dartz/dartz.dart';
import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';

class PostLogin extends UseCase<Login, LoginParams> {
  final AuthRepository _repo;

  PostLogin(this._repo);

  @override
  Future<Either<Failure, Login>> call(LoginParams params) =>
      _repo.login(params);
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    this.email = "",
    this.password = "",
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
