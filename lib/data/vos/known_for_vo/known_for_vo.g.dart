// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'known_for_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnownForVO _$KnownForVOFromJson(Map<String, dynamic> json) => KnownForVO(
      json['adult'] as bool?,
      json['backdrop_path'] as String?,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['id'] as int?,
      json['media_type'] as String?,
      json['original_language'] as String?,
      json['original_title'] as String?,
      json['overview'] as String?,
      json['poster_path'] as String?,
      json['release_date'] as String?,
      json['title'] as String?,
      json['video'] as bool?,
      (json['vote_average'] as num?)?.toDouble(),
      json['vote_count'] as int?,
    );

Map<String, dynamic> _$KnownForVOToJson(KnownForVO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'media_type': instance.mediaType,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overView,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
