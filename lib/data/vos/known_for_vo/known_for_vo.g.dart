// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'known_for_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KnownForVOAdapter extends TypeAdapter<KnownForVO> {
  @override
  final int typeId = 4;

  @override
  KnownForVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KnownForVO(
      fields[0] as bool?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<int>(),
      fields[3] as int?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as bool?,
      fields[12] as double?,
      fields[13] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, KnownForVO obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.genreIds)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.mediaType)
      ..writeByte(5)
      ..write(obj.originalLanguage)
      ..writeByte(6)
      ..write(obj.originalTitle)
      ..writeByte(7)
      ..write(obj.overView)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.video)
      ..writeByte(12)
      ..write(obj.voteAverage)
      ..writeByte(13)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KnownForVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
