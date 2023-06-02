import 'package:json_annotation/json_annotation.dart';
import '../../../data/vos/popular_vo/popular_vo.dart';

part 'popular_movies_response.g.dart';

@JsonSerializable()
class PopularMoviesResponse {
  @JsonKey(name: "pages")
  int? page;

  @JsonKey(name: "results")
  List<PopularVO>? results;

  @JsonKey(name: "total_pages")
  int? totalPages;

  @JsonKey(name: "total_results")
  int? totalResults;

  PopularMoviesResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory PopularMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesResponseFromJson(json);
}
