import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import '../data/model/movie_model.dart';
import 'package:flutter/foundation.dart';
import '../data/vos/cast-_vo/hive_cast_vo.dart';
import '../data/vos/crew_vo/hive_crew_vo.dart';
import '../data/vos/movie_vo/hive_similar_movie.dart';
import '../network/response/movie_detail_response/movie_detail_response.dart';

class MovieDetailPageBloc extends ChangeNotifier {
  bool isDispose = false;
  final MovieModel movieModel = MovieModelImpl();
  MovieDetailResponse? movieDetail;
  HiveCastVO? getCastList;
  HiveCrewVO? getCrewList;
  HiveSimilarMovieVO? getSimilarMovieList;

  MovieDetailPageBloc(int movieID) {
    ///fetch network call for movie detail response
    movieModel.getMovieDetail(movieID);

    ///fetch network call for hive cast vo
    movieModel.getCastList(movieID);

    ///fetch network call for hive crew vo
    movieModel.getCrewList(movieID);

    ///fetch network call for hive similar movie vo
    movieModel.getSimilarMovieList(movieID);

    /*----------------------------------------------------------------------------*/

    /// listen movie detail response  from data base
    movieModel.getMovieDetailFromDataBase(movieID).listen((event) {
      if (event != null) {
        movieDetail = event;
      }
      notifyListeners();
    });

    /// listen hive cast vo from data base
    movieModel.getCastFromDataBase(movieID).listen((event) {
      if (event != null) {
        getCastList = event;
      }
      notifyListeners();
    });

    /// listen hive crew vo from data base
    movieModel.getCrewFromDataBase(movieID).listen((event) {
      if (event != null) {
        getCrewList = event;
      }
      notifyListeners();
    });

    /// listen hive similar movie vo from data base
    movieModel.getSimilarMovieListFormDataBase(movieID).listen((event) {
      if (event != null) {
        getSimilarMovieList = event;
      }
      notifyListeners();
    });
  }

  @override
  void notifyListeners() {
    if (!isDispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDispose = true;
  }
}
