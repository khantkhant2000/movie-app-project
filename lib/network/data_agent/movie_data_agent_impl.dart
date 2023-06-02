import 'package:dio/dio.dart';
import 'package:movie_app_project_test/constant/api_constant.dart';
import 'package:movie_app_project_test/data/vos/cast-_vo/cast_vo.dart';
import 'package:movie_app_project_test/data/vos/crew_vo/crew_vo.dart';
import 'package:movie_app_project_test/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
import 'package:movie_app_project_test/data/vos/popular_vo/popular_vo.dart';
import 'package:movie_app_project_test/data/vos/production_companies_vo/production_companies_vo.dart';
import 'package:movie_app_project_test/data/vos/top_rated_vo/top_rated_vo.dart';
import 'package:movie_app_project_test/network/data_agent/movie_data_agent.dart';
import 'package:movie_app_project_test/network/response/actor_detail_response/actor_detail_response.dart';
import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';
import '../../data/vos/actor_result_vo/actor_result_vo.dart';
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
  Future<List<MovieVO>?> getMovieList() => _api
      .getNowPlayingResponse(kApiKey)
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
  Future<List<PopularVO>?> getPopularMovieList() => _api
      .getPopularMoviesResponse(kApiKey)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<TopRatedVO>?> getTopRateMovieList() => _api
      .getTopRatedResponse(kApiKey)
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
  Future<List<ProductionCompaniesVO>?> getProductionCompaniesList(
          int movieId) =>
      _api
          .getMovieDetailResponse(kApiKey, movieId)
          .asStream()
          .map((event) => event.productionCompanies)
          .first;

  @override
  Future<List<GenresVO>?> getGenresListForMovieType(int movieId) => _api
      .getMovieDetailResponse(kApiKey, movieId)
      .asStream()
      .map((event) => event.genres)
      .first;
}
