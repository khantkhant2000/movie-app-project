import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_project_test/data/vos/crew_vo/crew_vo.dart';
import '../../../constant/hive_constant.dart';

part 'hive_crew_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeHiveCrewVO)
class HiveCrewVO {
  @HiveField(0)
  List<CrewVO>? crewList;

  HiveCrewVO(this.crewList);
}
