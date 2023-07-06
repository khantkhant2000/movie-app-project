import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_project_test/constant/hive_constant.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';

part 'hive_movie_by_genres_id.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeGetMovieByGenresID)
class HiveMovieByGenresIDVO {
  @HiveField(0)
  List<MovieVO>? getMovieByGenresID;

  HiveMovieByGenresIDVO(this.getMovieByGenresID);
}
