import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/entities/auth/user_info.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/entities/auth/users.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/auth/get_user.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/auth/post_user_info.dart';
import 'package:dartz/dartz.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginParams loginParams);

  Future<Either<Failure, Register>> register(RegisterParams registerParams);

  Future<Either<Failure, UserInfo>> userInfo(UserInfoParams userInfoParams);

  Future<Either<Failure, User>> user(UserParams userInfoParams);
}
