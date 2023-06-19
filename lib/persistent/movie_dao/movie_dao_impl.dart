import 'package:hive/hive.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/hive_similar_movie.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
import 'package:movie_app_project_test/persistent/movie_dao/movie_dao.dart';
import '../../constant/hive_constant.dart';

class MovieDAOImpl extends MovieDAO {
  MovieDAOImpl._();

  static final MovieDAOImpl _singleton = MovieDAOImpl._();

  factory MovieDAOImpl() => _singleton;

  @override
  void saveForMovieList(List<MovieVO> moviesList) {
    for (MovieVO movieVO in moviesList) {
      _movieBox().put(movieVO.id, movieVO);
    }
  }

  @override
  void saveForSimilarMovieList(
          int movieID, HiveSimilarMovieVO similarMovieList) =>
      _similarMovieBox().put(movieID, similarMovieList);

  @override
  Stream watchMovieBox() => _movieBox().watch();

  @override
  Stream watchSimilarMovieBox() => _similarMovieBox().watch();
  /*--------------------------------------------------------------------------*/
  @override
  List<MovieVO>? getNowPlayingMovieListFromDataBase() {
    final getMovies = _movieBox().values.toList();
    return getMovies
        .where((element) => element.isGetNowPlayingMovies ?? false)
        .toList();
  }

  @override
  List<MovieVO>? getPopularMovieListFromDataBase() {
    final getMovies = _movieBox().values.toList();
    return getMovies
        .where((element) => element.isPopularMovies ?? false)
        .toList();
  }

  @override
  List<MovieVO>? getTopRatedMovieListFromDataBase() {
    final getMovies = _movieBox().values.toList();
    return getMovies
        .where((element) => element.isTopRatedMovies ?? false)
        .toList();
  }

  @override
  HiveSimilarMovieVO? getSimilarMovieListFormDataBase(int movieID) =>
      _similarMovieBox().get(movieID);
  /*--------------------------------------------------------------------------*/
  @override
  Stream<List<MovieVO>?> getNowPlayingMovieListFromDataBaseStream() =>
      Stream.value(getNowPlayingMovieListFromDataBase());

  @override
  Stream<List<MovieVO>?> getPopularMovieListFromDataBaseStream() =>
      Stream.value(getPopularMovieListFromDataBase());

  @override
  Stream<List<MovieVO>?> getTopRatedMovieListFromDataBaseStream() =>
      Stream.value(getTopRatedMovieListFromDataBase());
  @override
  Stream<HiveSimilarMovieVO?> getSimilarMovieListFormDataBaseStream(
          int movieID) =>
      Stream.value(getSimilarMovieListFormDataBase(movieID));

  Box<MovieVO> _movieBox() => Hive.box<MovieVO>(kBoxNameForMovies);
  Box<HiveSimilarMovieVO> _similarMovieBox() =>
      Hive.box<HiveSimilarMovieVO>(kBoxNameForHiveSimilarMovieVO);
}
