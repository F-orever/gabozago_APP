import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gabozago/app/enums/oauth_type.dart';

part 'base_user.freezed.dart';
part 'base_user.g.dart';

@freezed
class BaseUser with _$BaseUser {
  const factory BaseUser({
    required OAuthType provider,
    required String oauthId,
    required String email,
  }) = _BaseUser;

  factory BaseUser.fromJson(Map<String, Object?> json) => _$BaseUserFromJson(json);
}
