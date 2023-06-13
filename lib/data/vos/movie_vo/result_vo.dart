import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_project_test/constant/hive_constant.dart';

part 'result_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeMovieID)
class MovieVO {
  @JsonKey(name: 'adult')
  @HiveField(0)
  bool? adult;

  @JsonKey(name: 'backdrop_path')
  @HiveField(1)
  String? backdropPath;

  @JsonKey(name: 'genre_ids')
  @HiveField(2)
  List<int>? genreIds;

  @JsonKey(name: 'id')
  @HiveField(3)
  int? id;

  @JsonKey(name: 'original_language')
  @HiveField(4)
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  @HiveField(5)
  String? originalTitle;

  @JsonKey(name: 'overview')
  @HiveField(6)
  String? overview;

  @JsonKey(name: 'popularity')
  @HiveField(7)
  double? popularity;

  @JsonKey(name: 'poster_path')
  @HiveField(8)
  String? posterPath;

  @JsonKey(name: 'release_date')
  @HiveField(9)
  String? releaseDate;

  @JsonKey(name: 'title')
  @HiveField(10)
  String? title;

  @JsonKey(name: 'video')
  @HiveField(11)
  bool? video;

  @JsonKey(name: 'vote_average')
  @HiveField(12)
  double? voteAverage;

  @JsonKey(name: 'vote_count')
  @HiveField(13)
  int? voteCount;

  @HiveField(14)
  bool? isGetNowPlayingMovies;

  @HiveField(15)
  bool? isPopularMovies;

  @HiveField(16)
  bool? isTopRatedMovies;

  @HiveField(17)
  bool? isSimilarMovies;

  MovieVO(
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount, {
    this.isGetNowPlayingMovies = false,
    this.isPopularMovies = false,
    this.isSimilarMovies = false,
    this.isTopRatedMovies = false,
  });

  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount, isGetNowPlayingMovies: $isGetNowPlayingMovies, isPopularMovies: $isPopularMovies, isTopRatedMovies: $isTopRatedMovies, isSimilarMovies: $isSimilarMovies}';
  }
}
