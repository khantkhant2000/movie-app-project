// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_cast_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCastVOAdapter extends TypeAdapter<HiveCastVO> {
  @override
  final int typeId = 13;

  @override
  HiveCastVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCastVO(
      (fields[0] as List?)?.cast<CastVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveCastVO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.getCastList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCastVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiveCastVO _$HiveCastVOFromJson(Map<String, dynamic> json) => HiveCastVO(
      (json['getCastList'] as List<dynamic>?)
          ?.map((e) => CastVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HiveCastVOToJson(HiveCastVO instance) =>
    <String, dynamic>{
      'getCastList': instance.getCastList,
    };
