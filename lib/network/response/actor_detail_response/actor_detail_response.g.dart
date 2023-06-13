// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_detail_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActorDetailResponseAdapter extends TypeAdapter<ActorDetailResponse> {
  @override
  final int typeId = 11;

  @override
  ActorDetailResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActorDetailResponse(
      adult: fields[0] as bool?,
      alsoKnownAs: (fields[1] as List?)?.cast<String>(),
      biography: fields[2] as String?,
      birthday: fields[3] as String?,
      deathDay: fields[4] as String?,
      gender: fields[5] as int?,
      id: fields[6] as int?,
      imdbId: fields[7] as String?,
      knownForDepartment: fields[8] as String?,
      name: fields[9] as String?,
      placeOfBirth: fields[10] as String?,
      popularity: fields[11] as double?,
      profilePath: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ActorDetailResponse obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.alsoKnownAs)
      ..writeByte(2)
      ..write(obj.biography)
      ..writeByte(3)
      ..write(obj.birthday)
      ..writeByte(4)
      ..write(obj.deathDay)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.imdbId)
      ..writeByte(8)
      ..write(obj.knownForDepartment)
      ..writeByte(9)
      ..write(obj.name)
      ..writeByte(10)
      ..write(obj.placeOfBirth)
      ..writeByte(11)
      ..write(obj.popularity)
      ..writeByte(12)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorDetailResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorDetailResponse _$ActorDetailResponseFromJson(Map<String, dynamic> json) =>
    ActorDetailResponse(
      adult: json['adult'] as bool?,
      alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      biography: json['biography'] as String?,
      birthday: json['birthday'] as String?,
      deathDay: json['deathday'] as String?,
      gender: json['gender'] as int?,
      id: json['id'] as int?,
      imdbId: json['imdb_id'] as String?,
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String?,
      placeOfBirth: json['place_of_birth'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$ActorDetailResponseToJson(
        ActorDetailResponse instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'also_known_as': instance.alsoKnownAs,
      'biography': instance.biography,
      'birthday': instance.birthday,
      'deathday': instance.deathDay,
      'gender': instance.gender,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'place_of_birth': instance.placeOfBirth,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };
