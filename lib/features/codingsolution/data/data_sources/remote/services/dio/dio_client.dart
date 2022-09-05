import 'package:dio/dio.dart';

import 'package:codingsolution/features/codingsolution/data/data.dart';
import 'package:codingsolution/locator_service.dart';

class DioClient {
  String baseUrl = "http://codingsolutionedu.com:8000";

  String? _auth;
  bool _isUnitTest = false;
  late Dio _dio;

  DioClient({bool isUnitTest = false}) {
    _isUnitTest = isUnitTest;

    try {
      _auth = sl<AuthLocalDataSource>().token;
    } catch (_) {}

    _dio = _createDio();

    if (!_isUnitTest) _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio {
    if (_isUnitTest) {
      /// Return static dio if is unit test
      return _dio;
    } else {
      /// We need to recreate dio to avoid token issue after login
      try {
        _auth = sl<AuthLocalDataSource>().token;
      } catch (_) {}

      final dio = _createDio();

      if (!_isUnitTest) dio.interceptors.add(DioInterceptor());

      return dio;
    }
  }

  Future<Response> getRequest(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.get(url, queryParameters: queryParameters);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> postRequest(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    try {
      return await dio.post(url, data: data);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            if (_auth != null) ...{
              'Authorization': _auth,
            },
          },
          receiveTimeout: 60000,
          connectTimeout: 60000,
          validateStatus: (int? status) {
            return status! > 0;
          },
        ),
      );
}
