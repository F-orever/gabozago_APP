// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_response_model.freezed.dart';
part 'token_response_model.g.dart';

@freezed
class TokenResponseModel with _$TokenResponseModel {
  const factory TokenResponseModel({
    @JsonKey(name: "access") required String accessToken,
    @JsonKey(name: "refresh") required String refreshToken,
    @JsonKey(name: "access_expires_at") required DateTime accessExpiresAt,
    @JsonKey(name: "refresh_expires_at") required DateTime refreshExpiresAt,
  }) = _TokenResponseModel;

  factory TokenResponseModel.fromJson(Map<String, Object?> json) => _$TokenResponseModelFromJson(json);
}
