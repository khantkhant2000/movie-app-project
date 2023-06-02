import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
part 'get_similar_movie_response.g.dart';

@JsonSerializable()
class GetSimilarMovieResponse {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<MovieVO>? results;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'total_results')
  int? totalResults;

  GetSimilarMovieResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory GetSimilarMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSimilarMovieResponseFromJson(json);
}
