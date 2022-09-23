import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/entities/auth/users.dart';
import 'package:dartz/dartz.dart';

class GetUser extends UseCase<User, UserParams> {
  final AuthRepository _repo;

  GetUser(this._repo);

  @override
  Future<Either<Failure, User>> call(UserParams params) => _repo.user(params);
}

class UserParams {
  final String id;

  UserParams({
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
