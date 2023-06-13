import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'actor_detail_response.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeActorDetailID)
class ActorDetailResponse {
  @JsonKey(name: 'adult')
  @HiveField(0)
  bool? adult;

  @JsonKey(name: 'also_known_as')
  @HiveField(1)
  List<String>? alsoKnownAs;

  @JsonKey(name: 'biography')
  @HiveField(2)
  String? biography;

  @JsonKey(name: 'birthday')
  @HiveField(3)
  String? birthday;

  @JsonKey(name: 'deathday')
  @HiveField(4)
  String? deathDay;

  @JsonKey(name: 'gender')
  @HiveField(5)
  int? gender;

  @JsonKey(name: 'id')
  @HiveField(6)
  int? id;

  @JsonKey(name: 'imdb_id')
  @HiveField(7)
  String? imdbId;

  @JsonKey(name: 'known_for_department')
  @HiveField(8)
  String? knownForDepartment;

  @JsonKey(name: 'name')
  @HiveField(9)
  String? name;

  @JsonKey(name: 'place_of_birth')
  @HiveField(10)
  String? placeOfBirth;

  @JsonKey(name: 'popularity')
  @HiveField(11)
  double? popularity;

  @JsonKey(name: 'profile_path')
  @HiveField(12)
  String? profilePath;

  ActorDetailResponse(
      {this.adult,
      this.alsoKnownAs,
      this.biography,
      this.birthday,
      this.deathDay,
      this.gender,
      this.id,
      this.imdbId,
      this.knownForDepartment,
      this.name,
      this.placeOfBirth,
      this.popularity,
      this.profilePath});

  factory ActorDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ActorDetailResponseFromJson(json);
}
