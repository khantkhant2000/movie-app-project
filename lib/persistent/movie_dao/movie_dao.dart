import 'package:movie_app_project_test/data/vos/movie_vo/hive_movie_by_genres_id.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/hive_similar_movie.dart';

import '../../data/vos/movie_vo/result_vo.dart';

abstract class MovieDAO {
  void saveForMovieList(List<MovieVO> moviesList);
  void saveForSimilarMovieList(
      int movieID, HiveSimilarMovieVO similarMovieList);
  void saveForGetMovieByGenresID(
      int genresID, HiveMovieByGenresIDVO hiveMovieByGenresID);

  List<MovieVO>? getTopRatedMovieListFromDataBase();
  List<MovieVO>? getPopularMovieListFromDataBase();
  HiveSimilarMovieVO? getSimilarMovieListFormDataBase(int movieID);
  HiveMovieByGenresIDVO? getMovieByGenresIDFormDataBase(int genresID);

  Stream watchMovieBox();
  Stream watchSimilarMovieBox();
  Stream watchMovieByGenresID();

  Stream<List<MovieVO>?> getTopRatedMovieListFromDataBaseStream();
  Stream<List<MovieVO>?> getPopularMovieListFromDataBaseStream();
  Stream<HiveSimilarMovieVO?> getSimilarMovieListFormDataBaseStream(
      int movieID);
  Stream<HiveMovieByGenresIDVO?> getMovieByGenresIDFromDataBaseStream(
      int genresID);
}
