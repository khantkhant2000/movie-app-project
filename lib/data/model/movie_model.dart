import 'package:movie_app_project_test/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_app_project_test/network/response/actor_detail_response/actor_detail_response.dart';
import '../../network/response/movie_detail_response/movie_detail_response.dart';
import '../vos/actor_result_vo/actor_result_vo.dart';
import '../vos/cast-_vo/cast_vo.dart';
import '../vos/crew_vo/crew_vo.dart';
import '../vos/movie_vo/result_vo.dart';
import '../vos/search_movie_vo/search_movie_vo.dart';

abstract class MovieModel {
  Future<List<GenresVO>?> getGenresList();
  Future<List<MovieVO>?> getNowPlayingMovieList();
  Future<List<MovieVO>?> getTopRateMovieList();
  Future<List<MovieVO>?> getPopularMovieList();
  Future<List<MovieVO>?> getSimilarMovieList(int movieId);
  Future<List<ActorResultsVO>?> getActorsList();
  Future<MovieDetailResponse?> getMovieDetail(int movieId);
  Future<ActorDetailResponse?> getActorDetail(int id);
  Future<List<CastVO>?> getCastList(int movieID);
  Future<List<CrewVO>?> getCrewList(int movieID);
  Future<List<SearchMovieResultVO>?> getSearchMovie(String name);

  Stream<List<GenresVO>?> getGenresListFromDataBase();
  Stream<List<MovieVO>?> getNowPlayingMovieListFormDataBase();
  Stream<List<MovieVO>?> getTopRatedMovieListFormDataBase();
  Stream<List<MovieVO>?> getPopularMovieListFormDataBase();
  Stream<List<MovieVO>?> getSimilarMovieListFormDataBase();
  Stream<List<SearchMovieResultVO>?> getSearchMovieListFromDataBase();
  Stream<List<ActorResultsVO>?> getActorResultListFormDataBase();
  Stream<MovieDetailResponse?> getMovieDetailFromDataBase(int movieID);
  Stream<List<CastVO>?> getCastFromDataBase();
  Stream<List<CrewVO>?> getCrewFromDataBase();
  Stream<ActorDetailResponse?> getActorDetailFormDataBase(int actorID);
}
