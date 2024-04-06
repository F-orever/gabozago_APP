import 'package:get/get.dart';

import 'package:gabozago/domain/entities/login_entity.dart';
import 'package:gabozago/domain/entities/refresh_token_entity.dart';
import 'package:gabozago/domain/entities/token_response.dart';
import 'package:gabozago/domain/repositories/auth_repository.dart';

import '../data_sources/remote/auth_api.dart';
import '../models/token_response_model.dart';
import 'mappers/auth_mappr.dart';

final AuthMappr _mappr = AuthMappr();

class AuthRepositoryImpl extends AuthRepository {
  final AuthAPI _api = Get.find<AuthAPI>();

  @override
  Future<TokenResponse> login(LoginEntity loginEntity) async {
    TokenResponseModel response = await _api.login(loginEntity);

    return _mappr.convert<TokenResponseModel, TokenResponse>(response);
  }

  @override
  Future<TokenResponse> refreshToken(RefereshTokenEntity refereshTokenEntity) async {
    TokenResponseModel response = await _api.refreshToken(refereshTokenEntity);

    return _mappr.convert<TokenResponseModel, TokenResponse>(response);
  }
}
