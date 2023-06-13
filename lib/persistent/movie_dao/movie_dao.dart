import '../../data/vos/movie_vo/result_vo.dart';

abstract class MovieDAO {
  void saveForMovieList(List<MovieVO> moviesList);

  List<MovieVO>? getNowPlayingMovieListFromDataBase();
  List<MovieVO>? getTopRatedMovieListFromDataBase();
  List<MovieVO>? getPopularMovieListFromDataBase();
  List<MovieVO>? getSimilarMovieListFromDataBase();

  Stream watchMovieBox();

  Stream<List<MovieVO>?> getNowPlayingMovieListFromDataBaseStream();
  Stream<List<MovieVO>?> getTopRatedMovieListFromDataBaseStream();
  Stream<List<MovieVO>?> getPopularMovieListFromDataBaseStream();
  Stream<List<MovieVO>?> getSimilarMovieListFromDataBaseStream();
}
