import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_entity.freezed.dart';
part 'refresh_token_entity.g.dart';

@freezed
class RefereshTokenEntity with _$RefereshTokenEntity {
  const factory RefereshTokenEntity({
    required String refresh,
  }) = _RefereshTokenEntity;

  factory RefereshTokenEntity.fromJson(Map<String, Object?> json) => _$RefereshTokenEntityFromJson(json);
}
