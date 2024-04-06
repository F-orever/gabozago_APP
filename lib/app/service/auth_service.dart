import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:gabozago/domain/entities/login_entity.dart';
import 'package:gabozago/domain/entities/refresh_token_entity.dart';
import 'package:gabozago/domain/entities/token_response.dart';
import 'package:gabozago/domain/entities/user_oauth.dart';
import 'package:gabozago/domain/usecases/auth_usecases.dart';

import '../enums/oauth_type.dart';
import '../extension/parse_email_from_jwt.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final AuthUseCases _authUseCases = Get.find<AuthUseCases>();

  Rx<UserOAuth?> userOAuth = Rx<UserOAuth?>(null);
  Rx<TokenResponse?> token = Rx<TokenResponse?>(null);

  Future<void> login() async {
    try {
      TokenResponse tokenResponse = await _authUseCases.login.execute(
        LoginEntity(uid: 1234, provider: userOAuth.value!.provider, email: userOAuth.value!.email),
      );

      token.value = tokenResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loginWithOAuth(OAuthProvider oAuthType) async {
    late UserOAuth newUserOAuth;

    try {
      if (oAuthType == OAuthProvider.apple) {
        newUserOAuth = await _loginWithApple();
      } else if (oAuthType == OAuthProvider.google) {
        newUserOAuth = await _loginWithGoogle();
      } else if (oAuthType == OAuthProvider.kakao) {
        newUserOAuth = await _loginWithKakao();
      } else if (oAuthType == OAuthProvider.naver) {
        newUserOAuth = await _loginWithNaver();
      }

      userOAuth.value = newUserOAuth;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    // TODO: Implement logout
  }

  Future<void> refreshToken() async {
    try {
      TokenResponse tokenResponse = await _authUseCases.refreshToken.execute(
        RefereshTokenEntity(refresh: token.value!.refreshToken),
      );

      token.value = tokenResponse;
    } catch (e) {
      rethrow;
    }
  }
}

Future<UserOAuth> _loginWithApple() async {
  AuthorizationCredentialAppleID credential;

  try {
    credential = await SignInWithApple.getAppleIDCredential(
      scopes: [AppleIDAuthorizationScopes.email],
    );

    return UserOAuth(
      provider: OAuthProvider.apple,
      oauthId: credential.userIdentifier!,
      email: credential.email ?? credential.identityToken!.getEmail(),
    );
  } catch (e) {
    rethrow;
  }
}

Future<UserOAuth> _loginWithGoogle() async {
  try {
    GoogleSignInAccount? credential = await GoogleSignIn(scopes: ['email']).signIn();

    return UserOAuth(
      provider: OAuthProvider.google,
      oauthId: credential!.id,
      email: credential.email,
    );
  } catch (e) {
    rethrow;
  }
}

Future<UserOAuth> _loginWithKakao() async {
  User user;

  try {
    if (await isKakaoTalkInstalled()) {
      await UserApi.instance.loginWithKakaoTalk();
    } else {
      await UserApi.instance.loginWithKakaoAccount();
    }

    user = await UserApi.instance.me();

    return UserOAuth(
      provider: OAuthProvider.kakao,
      oauthId: user.id.toString(),
      email: user.kakaoAccount!.email!,
    );
  } catch (e) {
    rethrow;
  }
}

Future<UserOAuth> _loginWithNaver() async {
  try {
    NaverLoginResult result = await FlutterNaverLogin.logIn();

    if (result.status == NaverLoginStatus.loggedIn) {
      return UserOAuth(
        provider: OAuthProvider.naver,
        oauthId: result.account.id,
        email: result.account.email,
      );
    } else {
      throw Exception('Naver Login Failed.');
    }
  } catch (e) {
    rethrow;
  }
}
