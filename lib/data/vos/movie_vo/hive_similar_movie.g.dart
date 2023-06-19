// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_similar_movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSimilarMovieAdapter extends TypeAdapter<HiveSimilarMovieVO> {
  @override
  final int typeId = 15;

  @override
  HiveSimilarMovieVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSimilarMovieVO(
      (fields[0] as List?)?.cast<MovieVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveSimilarMovieVO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.similarMovieList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSimilarMovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiveSimilarMovieVO _$HiveSimilarMovieFromJson(Map<String, dynamic> json) =>
    HiveSimilarMovieVO(
      (json['similarMovieList'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HiveSimilarMovieToJson(HiveSimilarMovieVO instance) =>
    <String, dynamic>{
      'similarMovieList': instance.similarMovieList,
    };
