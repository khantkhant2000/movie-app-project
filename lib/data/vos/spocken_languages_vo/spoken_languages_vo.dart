import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'spoken_languages_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeMovieDetailSpokenLanguageID)
class SpokenLanguagesVO {
  @JsonKey(name: 'english_name')
  @HiveField(0)
  String? englishName;

  @JsonKey(name: 'iso_639_1')
  @HiveField(1)
  String? iso_639_1;

  @JsonKey(name: 'name')
  @HiveField(2)
  String? name;

  SpokenLanguagesVO(this.englishName, this.iso_639_1, this.name);

  factory SpokenLanguagesVO.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesVOFromJson(json);
}
