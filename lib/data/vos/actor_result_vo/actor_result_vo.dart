import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';
import '../known_for_vo/known_for_vo.dart';
part 'actor_result_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeActorID)
class ActorResultsVO {
  @JsonKey(name: 'adult')
  @HiveField(0)
  bool? adult;

  @JsonKey(name: 'gender')
  @HiveField(1)
  int? gender;

  @JsonKey(name: 'id')
  @HiveField(2)
  int? id;

  @JsonKey(name: 'known_for')
  @HiveField(3)
  List<KnownForVO>? knownFor;

  @JsonKey(name: 'known_for_department')
  @HiveField(4)
  String? knownForDepartment;

  @JsonKey(name: 'name')
  @HiveField(5)
  String? name;

  @JsonKey(name: 'popularity')
  @HiveField(6)
  double? popularity;

  @JsonKey(name: 'profile_path')
  @HiveField(7)
  String? profilePath;

  ActorResultsVO(
      {this.adult,
      this.gender,
      this.id,
      this.knownFor,
      this.knownForDepartment,
      this.name,
      this.popularity,
      this.profilePath});

  factory ActorResultsVO.fromJson(Map<String, dynamic> json) =>
      _$ActorResultsVOFromJson(json);

  @override
  String toString() {
    return 'ActorResultsVO{adult: $adult, gender: $gender, id: $id, knownFor: $knownFor, knownForDepartment: $knownForDepartment, name: $name, popularity: $popularity, profilePath: $profilePath}';
  }
}
