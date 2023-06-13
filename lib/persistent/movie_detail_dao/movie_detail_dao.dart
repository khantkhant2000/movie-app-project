import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';

abstract class MovieDetailDAO {
  void saveForMovieDetail(MovieDetailResponse movieDetail);

  MovieDetailResponse? getForMovieDetailFromDataBaseByID(int movieID);

  Stream watchMovieDetailBox();

  Stream<MovieDetailResponse?> getForMovieDetailFromDataBaseStreamByID(int movieID);
}
