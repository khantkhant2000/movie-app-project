import 'package:movie_app_project_test/data/model/movie_model.dart';
import 'package:movie_app_project_test/data/vos/cast-_vo/cast_vo.dart';
import 'package:movie_app_project_test/data/vos/crew_vo/crew_vo.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
import 'package:movie_app_project_test/data/vos/popular_vo/popular_vo.dart';
import 'package:movie_app_project_test/data/vos/production_companies_vo/production_companies_vo.dart';
import 'package:movie_app_project_test/data/vos/top_rated_vo/top_rated_vo.dart';
import 'package:movie_app_project_test/network/data_agent/movie_data_agent_impl.dart';
import 'package:movie_app_project_test/network/response/actor_detail_response/actor_detail_response.dart';
import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';
import '../../network/data_agent/movie_data_agent.dart';
import '../vos/actor_result_vo/actor_result_vo.dart';
import '../vos/genres_vo/genres_vo.dart';

class MovieModelImpl extends MovieModel {
  MovieModelImpl._();

  static final MovieModelImpl _singleton = MovieModelImpl._();

  factory MovieModelImpl() => _singleton;

  final MovieDataAgent _movieDataAgent = MovieDataAgentImpl();

  @override
  Future<List<GenresVO>?> getGenresList() => _movieDataAgent.getGenresList();

  @override
  Future<List<MovieVO>?> getMovieList() => _movieDataAgent.getMovieList();

  @override
  Future<List<ActorResultsVO>?> getActorsList() =>
      _movieDataAgent.getActorsList();

  @override
  Future<ActorDetailResponse?> getActorDetail(int id) =>
      _movieDataAgent.getActorDetail(id);

  @override
  Future<MovieDetailResponse?> getMovieDetail(int movieId) =>
      _movieDataAgent.getMovieDetail(movieId);

  @override
  Future<List<PopularVO>?> getPopularMovieList() =>
      _movieDataAgent.getPopularMovieList();

  @override
  Future<List<TopRatedVO>?> getTopRateMovieList() =>
      _movieDataAgent.getTopRateMovieList();

  @override
  Future<List<MovieVO>?> getSimilarMovieList(int movieId) =>
      _movieDataAgent.getSimilarMovieList(movieId);

  @override
  Future<List<CastVO>?> getCast(int movieID) =>
      _movieDataAgent.getCast(movieID);

  @override
  Future<List<CrewVO>?> getCrew(int movieID) =>
      _movieDataAgent.getCrew(movieID);

  @override
  Future<List<ProductionCompaniesVO>?> getProductionCompaniesList(
          int movieID) =>
      _movieDataAgent.getProductionCompaniesList(movieID);

  @override
  Future<List<GenresVO>?> getGenresListForMovieType(int movieId) =>
      _movieDataAgent.getGenresListForMovieType(movieId);
}
