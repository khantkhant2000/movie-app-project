import 'package:json_annotation/json_annotation.dart';
import '../../../data/vos/top_rated_vo/top_rated_vo.dart';

part 'top_rated_response.g.dart';

@JsonSerializable()
class TopRatedResponse {
  @JsonKey(name: "pages")
  int? page;

  @JsonKey(name: "results")
  List<TopRatedVO>? results;

  @JsonKey(name: "total_pages")
  int? totalPages;

  @JsonKey(name: "total_results")
  int? totalResults;

  TopRatedResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory TopRatedResponse.fromJson(Map<String, dynamic> json) =>
      _$TopRatedResponseFromJson(json);
}
