import 'package:dartz/dartz.dart';
import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginParams loginParams);

  Future<Either<Failure, Register>> register(RegisterParams registerParams);
}
