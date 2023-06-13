import 'package:hive/hive.dart';
import 'package:movie_app_project_test/constant/hive_constant.dart';
import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';

import 'movie_detail_dao.dart';

class MovieDetailDAOImpl extends MovieDetailDAO {
  MovieDetailDAOImpl._();
  static final MovieDetailDAOImpl _singleton = MovieDetailDAOImpl._();
  factory MovieDetailDAOImpl() => _singleton;

  @override
  void saveForMovieDetail(MovieDetailResponse movieDetail) {
    _movieDetailBox().put(movieDetail.id, movieDetail);
  }

  @override
  MovieDetailResponse? getForMovieDetailFromDataBaseByID(int movieID) =>
      _movieDetailBox().get(movieID);

  Box<MovieDetailResponse> _movieDetailBox() =>
      Hive.box<MovieDetailResponse>(kBoxNameForMovieDetail);

  @override
  Stream<MovieDetailResponse?> getForMovieDetailFromDataBaseStreamByID(
          int movieID) =>
      Stream.value(getForMovieDetailFromDataBaseByID(movieID));

  @override
  Stream watchMovieDetailBox() => _movieDetailBox().watch();
}
