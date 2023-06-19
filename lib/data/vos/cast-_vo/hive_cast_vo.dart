import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_project_test/constant/hive_constant.dart';
import 'cast_vo.dart';

part 'hive_cast_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeHiveCastVO)
class HiveCastVO {
  @HiveField(0)
  List<CastVO>? getCastList;

  HiveCastVO(this.getCastList);
}
