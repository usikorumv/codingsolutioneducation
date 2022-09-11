// ignore_for_file: camel_case_types

import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/data/data.dart';
import 'package:codingsolution/features/codingsolution/domain/usecases/courses/get_courses.dart';
import 'package:codingsolution/features/codingsolution/domain/usecases/courses/post_register_course.dart';
import 'package:dio/dio.dart';

abstract class CoursesRemoteDatasource {
  Future<CoursesResponse> courses(CoursesParams registerParams);

  Future<bool> courseRegister(RegisterCourseParams loginParams);
}

class CodingSolutionCourseRemoteDatasourceImpl
    implements CoursesRemoteDatasource {
  final DioClient _client;

  CodingSolutionCourseRemoteDatasourceImpl(this._client);

  @override
  Future<CoursesResponse> courses(CoursesParams coursesParams) async {
    try {
      final Response response;

      if (coursesParams.showRegistered) {
        response = await _client.getRequest(
          "${Api.coursesRegister}/",
          queryParameters: coursesParams.toJson(),
        );
      } else {
        response = await _client.getRequest(
          "${Api.courses}/",
          queryParameters: coursesParams.toJson(),
        );
      }

      final result = CoursesResponse.fromJson(response.data);

      if (response.statusCode == 200) {
        return result;
      } else {
        throw ServerException("Error");
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<bool> courseRegister(RegisterCourseParams registerCourseParams) async {
    try {
      final response = await _client.postRequest(
        "${Api.courses}/",
        data: registerCourseParams.toJson(),
      );
      final result = RegisterResponse.fromJson(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw ServerException("Error");
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  // @override
  // Future<LoginResponse> login(LoginParams loginParams) async {
  // try {
  //   final response = await _client.postRequest(
  //     "${Api.login}/",
  //     data: loginParams.toJson(),
  //   );
  //   final result = LoginResponse.fromJson(response.data);

  //   if (response.statusCode == 200) {
  //     return result;
  //   } else {
  //     throw ServerException(result.error);
  //   }
  // } on ServerException catch (e) {
  //   throw ServerException(e.message);
  // }
  // }
}
