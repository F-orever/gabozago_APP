import '../entities/login_entity.dart';
import '../entities/refresh_token_entity.dart';
import '../entities/token_response.dart';

abstract class AuthRepository {
  Future<TokenResponse> login(LoginEntity loginEntity);
  Future<TokenResponse> refreshToken(RefereshTokenEntity refereshTokenEntity);
}
