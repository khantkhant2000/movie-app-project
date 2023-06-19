// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_crew_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCrewVOAdapter extends TypeAdapter<HiveCrewVO> {
  @override
  final int typeId = 14;

  @override
  HiveCrewVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCrewVO(
      (fields[0] as List?)?.cast<CrewVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveCrewVO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.crewList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCrewVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiveCrewVO _$HiveCrewVOFromJson(Map<String, dynamic> json) => HiveCrewVO(
      (json['crewList'] as List<dynamic>?)
          ?.map((e) => CrewVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HiveCrewVOToJson(HiveCrewVO instance) =>
    <String, dynamic>{
      'crewList': instance.crewList,
    };
