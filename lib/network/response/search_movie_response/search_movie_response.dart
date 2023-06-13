import 'package:json_annotation/json_annotation.dart';
import '../../../data/vos/search_movie_vo/search_movie_vo.dart';

part 'search_movie_response.g.dart';

@JsonSerializable()
class SearchMovieResponse {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<SearchMovieResultVO>? results;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'total_results')
  int? totalResults;

  SearchMovieResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory SearchMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieResponseFromJson(json);
}
