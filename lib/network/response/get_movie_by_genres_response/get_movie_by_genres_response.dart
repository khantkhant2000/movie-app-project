import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
import '../../../data/vos/date_vo/date_vo.dart';

part 'get_movie_by_genres_response.g.dart';

@JsonSerializable()
class GetMovieByGenresResponse {
  @JsonKey(name: 'dates')
  DatesVO? dates;

  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<MovieVO>? results;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'total_results')
  int? totalResults;

  GetMovieByGenresResponse(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  factory GetMovieByGenresResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMovieByGenresResponseFromJson(json);
}
