// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_response.freezed.dart';
part 'token_response.g.dart';

@freezed
class TokenResponse with _$TokenResponse {
  const factory TokenResponse({
    @JsonKey(name: "access") required String accessToken,
    @JsonKey(name: "refresh") required String refreshToken,
    @JsonKey(name: "access_expires_at") required DateTime accessExpiresAt,
    @JsonKey(name: "refresh_expires_at") required DateTime refreshExpiresAt,
  }) = _TokenResponse;

  factory TokenResponse.fromJson(Map<String, Object?> json) => _$TokenResponseFromJson(json);
}
