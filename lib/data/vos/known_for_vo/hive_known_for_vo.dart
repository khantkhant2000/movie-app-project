import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'known_for_vo.dart';
import '../../../constant/hive_constant.dart';

part 'hive_known_for_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeHiveKnownForMovieVO)
class HiveKnownForVO {
  @HiveField(0)
  List<KnownForVO>? knownForMovieList;

  HiveKnownForVO(this.knownForMovieList);
}
