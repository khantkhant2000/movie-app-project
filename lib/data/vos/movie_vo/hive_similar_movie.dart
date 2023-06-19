import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_project_test/constant/hive_constant.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';

part 'hive_similar_movie.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeHiveSimilarMovieVO)
class HiveSimilarMovieVO {
  @HiveField(0)
  List<MovieVO>? similarMovieList;

  HiveSimilarMovieVO(this.similarMovieList);
}
