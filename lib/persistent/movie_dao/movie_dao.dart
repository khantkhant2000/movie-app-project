import 'package:movie_app_project_test/data/vos/movie_vo/hive_similar_movie.dart';

import '../../data/vos/movie_vo/result_vo.dart';

abstract class MovieDAO {
  void saveForMovieList(List<MovieVO> moviesList);
  void saveForSimilarMovieList(
      int movieID, HiveSimilarMovieVO similarMovieList);

  List<MovieVO>? getNowPlayingMovieListFromDataBase();
  List<MovieVO>? getTopRatedMovieListFromDataBase();
  List<MovieVO>? getPopularMovieListFromDataBase();
  HiveSimilarMovieVO? getSimilarMovieListFormDataBase(int movieID);

  Stream watchMovieBox();
  Stream watchSimilarMovieBox();

  Stream<List<MovieVO>?> getNowPlayingMovieListFromDataBaseStream();
  Stream<List<MovieVO>?> getTopRatedMovieListFromDataBaseStream();
  Stream<List<MovieVO>?> getPopularMovieListFromDataBaseStream();
  Stream<HiveSimilarMovieVO?> getSimilarMovieListFormDataBaseStream(
      int movieID);
}
