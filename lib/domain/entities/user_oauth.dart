import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gabozago/app/enums/oauth_type.dart';

part 'user_oauth.freezed.dart';
part 'user_oauth.g.dart';

@freezed
class UserOAuth with _$UserOAuth {
  const factory UserOAuth({
    required OAuthProvider provider,
    required String oauthId,
    required String email,
  }) = _OAuthUser;

  factory UserOAuth.fromJson(Map<String, Object?> json) => _$UserOAuthFromJson(json);
}
