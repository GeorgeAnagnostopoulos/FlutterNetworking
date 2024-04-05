import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
class Game with _$Game {
  Game._();

  factory Game({
    @JsonKey(includeToJson: false) required String id,
    required String name,
    required String photo,
    required String console,
    @JsonKey(name: "release_year", includeToJson: false) required String releaseYear,
    @JsonKey(name: "created_at", includeToJson: false) required String createdAt,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
