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
  @HiveField(18)
  bool? isGetMovieByGenres;

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
    this.isGetMovieByGenres = false,
  });

  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id,'
        ' originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview,'
        ' popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, '
        'video: $video, voteAverage: $voteAverage, voteCount: $voteCount, isGetNowPlayingMovies: $isGetNowPlayingMovies, '
        'isPopularMovies: $isPopularMovies, isTopRatedMovies: $isTopRatedMovies, isSimilarMovies: $isSimilarMovies,'
        ' isGetMovieByGenres: $isGetMovieByGenres}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVO &&
          runtimeType == other.runtimeType &&
          adult == other.adult &&
          backdropPath == other.backdropPath &&
          genreIds == other.genreIds &&
          id == other.id &&
          originalLanguage == other.originalLanguage &&
          originalTitle == other.originalTitle &&
          overview == other.overview &&
          popularity == other.popularity &&
          posterPath == other.posterPath &&
          releaseDate == other.releaseDate &&
          title == other.title &&
          video == other.video &&
          voteAverage == other.voteAverage &&
          voteCount == other.voteCount &&
          isGetNowPlayingMovies == other.isGetNowPlayingMovies &&
          isPopularMovies == other.isPopularMovies &&
          isTopRatedMovies == other.isTopRatedMovies &&
          isSimilarMovies == other.isSimilarMovies &&
          isGetMovieByGenres == other.isGetMovieByGenres;

  @override
  int get hashCode =>
      adult.hashCode ^
      backdropPath.hashCode ^
      genreIds.hashCode ^
      id.hashCode ^
      originalLanguage.hashCode ^
      originalTitle.hashCode ^
      overview.hashCode ^
      popularity.hashCode ^
      posterPath.hashCode ^
      releaseDate.hashCode ^
      title.hashCode ^
      video.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode ^
      isGetNowPlayingMovies.hashCode ^
      isPopularMovies.hashCode ^
      isTopRatedMovies.hashCode ^
      isSimilarMovies.hashCode ^
      isGetMovieByGenres.hashCode;
}
