import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';
import 'package:dartz/dartz.dart';

class PostRegister extends UseCase<Register, RegisterParams> {
  final AuthRepository _repo;

  PostRegister(this._repo);

  @override
  Future<Either<Failure, Register>> call(RegisterParams params) =>
      _repo.register(params);
}

class RegisterParams {
  final String email;
  final String password;

  RegisterParams({
    this.email = "",
    this.password = "",
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class CodeSolutionRegisterParams extends RegisterParams {
  @override
  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "password2": password,
      };
}
