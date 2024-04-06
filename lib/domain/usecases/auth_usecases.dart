import 'package:get/get.dart';

import '../entities/login_entity.dart';
import '../entities/refresh_token_entity.dart';
import '../entities/token_response.dart';
import '../repositories/auth_repository.dart';

class AuthUseCases {
  final AuthRepository _repository = Get.find<AuthRepository>();

  LoginUseCase get login => LoginUseCase(_repository);
  RefreshTokenUseCase get refreshToken => RefreshTokenUseCase(_repository);
}

class LoginUseCase {
  final AuthRepository _repository;
  LoginUseCase(this._repository);

  Future<TokenResponse> execute(LoginEntity loginEntity) async {
    return await _repository.login(loginEntity);
  }
}

class RefreshTokenUseCase {
  final AuthRepository _repository;
  RefreshTokenUseCase(this._repository);

  Future<TokenResponse> execute(RefereshTokenEntity refreshToken) async {
    return await _repository.refreshToken(refreshToken);
  }
}
