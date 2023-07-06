import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_project_test/constant/hive_constant.dart';

part 'genres_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeGenresID)
class GenresVO {
  @JsonKey(name: 'id')
  @HiveField(1)
  int? id;

  @JsonKey(name: 'name')
  @HiveField(2)
  String? name;

  bool isSelected;

  GenresVO(
    this.id,
    this.name, {
    this.isSelected = false,
  });

  factory GenresVO.fromJson(Map<String, dynamic> json) =>
      _$GenresVOFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenresVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          isSelected == other.isSelected;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ isSelected.hashCode;
}
