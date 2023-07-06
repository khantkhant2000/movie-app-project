import 'package:movie_app_project_test/data/vos/cast-_vo/cast_vo.dart';
import 'package:movie_app_project_test/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
import 'package:movie_app_project_test/network/response/actor_detail_response/actor_detail_response.dart';
import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';
import '../../data/vos/actor_result_vo/actor_result_vo.dart';
import '../../data/vos/crew_vo/crew_vo.dart';
import '../../data/vos/search_movie_vo/search_movie_vo.dart';

abstract class MovieDataAgent {
  Future<List<GenresVO>?> getGenresList();

  Future<List<MovieVO>?> getTopRateMovieList(int moviePage);

  Future<List<MovieVO>?> getPopularMovieList(int moviePage);

  Future<List<MovieVO>?> getNowPlayingMovieList();

  Future<List<MovieVO>?> getSimilarMovieList(int movieID);

  Future<List<ActorResultsVO>?> getActorsList();

  Future<ActorDetailResponse?> getActorDetail(int id);

  Future<MovieDetailResponse?> getMovieDetail(int movieId);

  Future<List<CastVO>?> getCast(int movieID);

  Future<List<CrewVO>?> getCrew(int movieID);

  Future<List<SearchMovieResultVO>?> getSearchMovieList(String name);

  Future<List<MovieVO>?> getMovieByGenres(int genresID);
}
