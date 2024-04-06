import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:gabozago/domain/entities/token_response.dart';

import '../../service/auth_service.dart';

class TokenInterceptor extends QueuedInterceptorsWrapper {
  final Dio _dio;
  final _authHeaderKey = 'Authorization';

  TokenInterceptor(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) print('onRequest TokenInterceptor ${options.uri}');

    TokenResponse? token = AuthService.to.token.value;

    if (token == null) return;
    try {
      final bool isExpired = token.accessExpiresAt.isBefore(DateTime.now());
      if (isExpired) {
        await AuthService.to.refreshToken();
        token = AuthService.to.token.value;
      }

      if (options.headers['withToken'] != 'false') {
        options.headers[_authHeaderKey] = 'Bearer ${token!.accessToken}';
      }

      handler.next(options);
    } on DioException catch (e) {
      handler.reject(e);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (kDebugMode) print('onError TokenInterceptor ${err.requestOptions.uri}');

      await _refreshTokenAndRetry(err.requestOptions, handler);
    }

    handler.next(err);
  }

  Future<void> _refreshTokenAndRetry(
    RequestOptions requestOptions,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      await AuthService.to.refreshToken();

      final Response response = await _dio.fetch(requestOptions);

      handler.resolve(response);
    } on DioException catch (e) {
      await AuthService.to.logout();

      handler.reject(e);
    }
  }
}
