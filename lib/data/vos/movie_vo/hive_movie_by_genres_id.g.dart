// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_movie_by_genres_id.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMovieByGenresIDAdapter extends TypeAdapter<HiveMovieByGenresIDVO> {
  @override
  final int typeId = 17;

  @override
  HiveMovieByGenresIDVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMovieByGenresIDVO(
      (fields[0] as List?)?.cast<MovieVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveMovieByGenresIDVO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.getMovieByGenresID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMovieByGenresIDAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiveMovieByGenresIDVO _$HiveMovieByGenresIDFromJson(
        Map<String, dynamic> json) =>
    HiveMovieByGenresIDVO(
      (json['getMovieByGenresID'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HiveMovieByGenresIDToJson(
        HiveMovieByGenresIDVO instance) =>
    <String, dynamic>{
      'getMovieByGenresID': instance.getMovieByGenresID,
    };
