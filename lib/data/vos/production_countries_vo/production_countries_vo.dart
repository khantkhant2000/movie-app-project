import 'package:json_annotation/json_annotation.dart';

part 'production_countries_vo.g.dart';

@JsonSerializable()
class ProductionCountriesVO {
  @JsonKey(name: 'iso_3166_1')
  String? iso_3166_1;

  @JsonKey(name: 'name')
  String? name;

  ProductionCountriesVO(this.iso_3166_1, this.name);

  factory ProductionCountriesVO.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesVOFromJson(json);
}
