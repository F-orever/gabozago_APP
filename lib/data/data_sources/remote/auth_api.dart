import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import 'package:gabozago/domain/entities/login_entity.dart';
import 'package:gabozago/domain/entities/refresh_token_entity.dart';

import '../../models/token_response_model.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthAPI {
  factory AuthAPI(Dio dioBuilder) = _AuthAPI;

  @POST('/user/app/login')
  @Headers({'withToken': 'false'})
  Future<TokenResponseModel> login(@Body() LoginEntity loginEntity);

  @POST('/user/jwt-token-auth/refresh/')
  @Headers({'withToken': 'false'})
  Future<TokenResponseModel> refreshToken(@Body() RefereshTokenEntity refereshTokenEntity);
}
