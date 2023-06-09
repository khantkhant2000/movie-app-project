import 'package:dio/dio.dart';
import 'package:movie_app_project_test/constant/api_constant.dart';
import 'package:movie_app_project_test/data/vos/cast-_vo/cast_vo.dart';
import 'package:movie_app_project_test/data/vos/crew_vo/crew_vo.dart';
import 'package:movie_app_project_test/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
import 'package:movie_app_project_test/network/data_agent/movie_data_agent.dart';
import 'package:movie_app_project_test/network/response/actor_detail_response/actor_detail_response.dart';
import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';
import '../../data/vos/actor_result_vo/actor_result_vo.dart';
import '../../data/vos/search_movie_vo/search_movie_vo.dart';
import '../api/movie_api.dart';

class MovieDataAgentImpl extends MovieDataAgent {
  late MovieAPI _api;
  MovieDataAgentImpl._() {
    _api = MovieAPI(Dio());
  }

  static final MovieDataAgentImpl _singleton = MovieDataAgentImpl._();
  factory MovieDataAgentImpl() => _singleton;

  @override
  Future<List<ActorResultsVO>?> getActorsList() => _api
      .getActorsResponse(kApiKey)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<GenresVO>?> getGenresList() => _api
      .getGenresResponse(kApiKey)
      .asStream()
      .map((event) => event.genres)
      .first;

  @override
  Future<List<MovieVO>?> getNowPlayingMovieList() => _api
      .getMovieByGenres(kApiKey)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<ActorDetailResponse?> getActorDetail(int id) =>
      _api.getActorDetailResponse(kApiKey, id);

  @override
  Future<MovieDetailResponse?> getMovieDetail(int movieId) =>
      _api.getMovieDetailResponse(kApiKey, movieId);

  @override
  Future<List<MovieVO>?> getPopularMovieList(int moviePage) => _api
      .getPopularMoviesResponse(kApiKey, moviePage)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<MovieVO>?> getTopRateMovieList(int moviePage) => _api
      .getTopRatedResponse(kApiKey, moviePage)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<MovieVO>?> getSimilarMovieList(int movieID) => _api
      .getSimilarResponse(kApiKey, movieID)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<CastVO>?> getCast(int movieID) => _api
      .getCreditsResponse(kApiKey, movieID)
      .asStream()
      .map((event) => event.cast)
      .first;

  @override
  Future<List<CrewVO>?> getCrew(int movieID) => _api
      .getCreditsResponse(kApiKey, movieID)
      .asStream()
      .map((event) => event.crew)
      .first;

  @override
  Future<List<SearchMovieResultVO>?> getSearchMovieList(String name) => _api
      .getSearchMovieResponse(kApiKey, name)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<MovieVO>?> getMovieByGenres(int genresID) => _api
      .getMovieByGenresResponse(kApiKey, genresID)
      .asStream()
      .map((event) => event.results)
      .first;
}
