// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String,
      console: json['console'] as String,
      releaseYear: json['release_year'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photo': instance.photo,
      'console': instance.console,
    };
