// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_known_for_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveKnownForVOAdapter extends TypeAdapter<HiveKnownForVO> {
  @override
  final int typeId = 16;

  @override
  HiveKnownForVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveKnownForVO(
      (fields[0] as List?)?.cast<KnownForVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveKnownForVO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.knownForMovieList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveKnownForVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiveKnownForVO _$HiveKnownForVOFromJson(Map<String, dynamic> json) =>
    HiveKnownForVO(
      (json['knownForMovieList'] as List<dynamic>?)
          ?.map((e) => KnownForVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HiveKnownForVOToJson(HiveKnownForVO instance) =>
    <String, dynamic>{
      'knownForMovieList': instance.knownForMovieList,
    };
