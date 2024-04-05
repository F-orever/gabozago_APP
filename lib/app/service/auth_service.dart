import 'package:flutter/foundation.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:gabozago/domain/entities/base_user.dart';

import '../enums/oauth_type.dart';
import '../extension/parse_email_from_jwt.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  Future<void> login(OAuthType oAuthType) async {
    BaseUser? user;

    try {
      if (oAuthType == OAuthType.apple) {
        user = await _loginWithApple();
      } else if (oAuthType == OAuthType.google) {
        user = await _loginWithGoogle();
      } else if (oAuthType == OAuthType.kakao) {
        user = await _loginWithKakao();
      } else if (oAuthType == OAuthType.naver) {
        user = await _loginWithNaver();
      }
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }
}

Future<BaseUser?> _loginWithApple() async {
  AuthorizationCredentialAppleID credential;

  try {
    credential = await SignInWithApple.getAppleIDCredential(
      scopes: [AppleIDAuthorizationScopes.email],
    );

    return BaseUser(
      provider: OAuthType.apple,
      oauthId: credential.userIdentifier!,
      email: credential.email ?? credential.identityToken!.getEmail(),
    );
  } catch (e) {
    rethrow;
  }
}

Future<BaseUser?> _loginWithGoogle() async {
  try {
    GoogleSignInAccount? credential = await GoogleSignIn(scopes: ['email']).signIn();

    if (credential != null) {
      return BaseUser(
        provider: OAuthType.google,
        oauthId: credential.id,
        email: credential.email,
      );
    }
  } catch (e) {
    rethrow;
  }
  return null;
}

Future<BaseUser?> _loginWithKakao() async {
  User user;

  try {
    if (await isKakaoTalkInstalled()) {
      await UserApi.instance.loginWithKakaoTalk();
    } else {
      await UserApi.instance.loginWithKakaoAccount();
    }

    user = await UserApi.instance.me();

    return BaseUser(
      provider: OAuthType.kakao,
      oauthId: user.id.toString(),
      email: user.kakaoAccount!.email!,
    );
  } catch (e) {
    rethrow;
  }
}

Future<BaseUser?> _loginWithNaver() async {
  try {
    NaverLoginResult result = await FlutterNaverLogin.logIn();

    return BaseUser(
      provider: OAuthType.naver,
      oauthId: result.account.id,
      email: result.account.email,
    );
  } catch (e) {
    rethrow;
  }
}
