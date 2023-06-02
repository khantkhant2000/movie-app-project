import 'package:movie_app_project_test/data/vos/cast-_vo/cast_vo.dart';
import 'package:movie_app_project_test/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
import 'package:movie_app_project_test/network/response/actor_detail_response/actor_detail_response.dart';
import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';
import '../../data/vos/actor_result_vo/actor_result_vo.dart';
import '../../data/vos/crew_vo/crew_vo.dart';
import '../../data/vos/popular_vo/popular_vo.dart';
import '../../data/vos/production_companies_vo/production_companies_vo.dart';
import '../../data/vos/top_rated_vo/top_rated_vo.dart';

abstract class MovieDataAgent {
  Future<List<GenresVO>?> getGenresList();

  Future<List<GenresVO>?> getGenresListForMovieType(int movieId);

  Future<List<TopRatedVO>?> getTopRateMovieList();

  Future<List<PopularVO>?> getPopularMovieList();

  Future<List<MovieVO>?> getMovieList();

  Future<List<ActorResultsVO>?> getActorsList();

  Future<List<MovieVO>?> getSimilarMovieList(int movieID);

  Future<ActorDetailResponse?> getActorDetail(int id);

  Future<MovieDetailResponse?> getMovieDetail(int movieId);

  Future<List<CastVO>?> getCast(int movieID);

  Future<List<CrewVO>?> getCrew(int movieID);

  Future<List<ProductionCompaniesVO>?> getProductionCompaniesList(int movieId);
}