// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresVO _$GenresVOFromJson(Map<String, dynamic> json) => GenresVO(
      json['id'] as int?,
      json['name'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$GenresVOToJson(GenresVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isSelected': instance.isSelected,
    };
