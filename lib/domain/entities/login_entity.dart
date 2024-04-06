// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gabozago/app/enums/oauth_type.dart';

part 'login_entity.freezed.dart';
part 'login_entity.g.dart';

@freezed
class LoginEntity with _$LoginEntity {
  const factory LoginEntity({
    required int uid,
    required OAuthProvider provider,
    required String email,
    String? nickname,
    @JsonKey(name: "profile_pic") String? profileImage,
  }) = _LoginEntity;

  factory LoginEntity.fromJson(Map<String, Object?> json) => _$LoginEntityFromJson(json);
}
