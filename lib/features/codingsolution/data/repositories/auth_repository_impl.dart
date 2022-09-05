import 'package:dartz/dartz.dart';
import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/data/data.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';


class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;

  const AuthRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, Login>> login(LoginParams loginParams) async {
    try {
      final response = await authRemoteDatasource.login(loginParams);

      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Register>> register(
    RegisterParams registerParams,
  ) async {
    try {
      final response = await authRemoteDatasource.register(registerParams);

      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
