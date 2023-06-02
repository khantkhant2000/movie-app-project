import 'package:json_annotation/json_annotation.dart';

part 'genres_vo.g.dart';

@JsonSerializable()
class GenresVO {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  bool isSelected;

  GenresVO(this.id, this.name, {this.isSelected = false});

  factory GenresVO.fromJson(Map<String, dynamic> json) =>
      _$GenresVOFromJson(json);
}
