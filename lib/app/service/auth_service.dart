import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      } else if (oAuthType == OAuthType.naver) {}
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
