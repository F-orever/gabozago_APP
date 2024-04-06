import 'package:dio/dio.dart';

import '../../config/app_const.dart';
import '../interceptor/token_interceptor.dart';

class DioBuilder extends DioMixin implements Dio {
  final Duration connectionTimeOutMls = const Duration(milliseconds: 10000);
  final Duration readTimeOutMls = const Duration(milliseconds: 10000);
  final Duration writeTimeOutMls = const Duration(milliseconds: 10000);

  DioBuilder({
    required BaseOptions options,
  }) {
    options = BaseOptions(
      responseType: ResponseType.json,
      baseUrl: AppConst.baseUrl,
      contentType: Headers.jsonContentType,
      connectTimeout: connectionTimeOutMls,
      receiveTimeout: readTimeOutMls,
      sendTimeout: writeTimeOutMls,
    );

    this.options = options;

    // Add interceptor for JWT
    interceptors.add(TokenInterceptor(this));

    // Add interceptor for logging
    // if (kDebugMode) {
    //   interceptors.add(LogInterceptor(
    //     requestBody: true,
    //     responseBody: true,
    //   ));
    // }

    httpClientAdapter = HttpClientAdapter();
  }
}
