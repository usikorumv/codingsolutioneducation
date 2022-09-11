// ignore_for_file: camel_case_types

import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/data/data.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterResponse> register(RegisterParams registerParams);

  Future<LoginResponse> login(LoginParams loginParams);
}

class CodingSolutionRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  CodingSolutionRemoteDatasourceImpl(this._client);

  @override
  Future<RegisterResponse> register(
    RegisterParams registerParams,
  ) async {
    try {
      final response = await _client.postRequest(
        "${Api.register}/",
        data: registerParams.toJson(),
      );

      final result = RegisterResponse.fromJson(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return result;
      } else {
        throw ServerException("Error");
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<LoginResponse> login(LoginParams loginParams) async {
    try {
      final response = await _client.postRequest(
        "${Api.login}/",
        data: loginParams.toJson(),
      );
      final result = LoginResponse.fromJson(response.data);

      if (response.statusCode == 200) {
        return result;
      } else {
        throw ServerException(result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
