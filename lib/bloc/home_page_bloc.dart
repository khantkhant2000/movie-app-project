import 'package:flutter/material.dart';
import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import '../data/model/movie_model.dart';
import '../data/vos/actor_result_vo/actor_result_vo.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import '../data/vos/movie_vo/result_vo.dart';

class HomePageBloc extends ChangeNotifier {
  final MovieModel _movieModel = MovieModelImpl();

  bool isDispose = false;
  List<GenresVO> genresList = [];
  List<MovieVO> getNowPlayingMovieList = [];
  List<MovieVO> getTopRatedMovieList = [];
  List<MovieVO> getPopularMoviesList = [];
  List<ActorResultsVO> actorsList = [];

  HomePageBloc() {
    ///fetch NetWork Call for Genres list
    _movieModel.getGenresList();

    ///fetch network call for getNowPlaying Movie (Carousel Slider & Get Now Playing Movie )
    _movieModel.getNowPlayingMovieList();

    ///fetch network call for Top Rated Movie
    _movieModel.getTopRateMovieList();

    ///fetch network call for Top Rated Movie
    _movieModel.getPopularMovieList();

    ///fetch network call for Top Rated Movie
    _movieModel.getActorsList();

    /*-------------------------------------------------------------------------*/

    /// Listen Genres List From DataBase
    _movieModel.getGenresListFromDataBase().listen((event) {
      if (event != null) {
        genresList = event;
        final firstData = genresList.first;
        firstData.isSelected = true;
        genresList.removeAt(0);
        genresList.insert(0, firstData);
      }
      notifyListeners();
    });

    ///listen getNowPlaying Movie List from DataBase (Carousel Slider & Get Now Playing Movie )
    _movieModel.getNowPlayingMovieListFormDataBase().listen((event) {
      if (event != null) {
        getNowPlayingMovieList = event;
      }
      notifyListeners();
    });

    ///listen Top Rated Movie List from DataBase
    _movieModel.getTopRatedMovieListFormDataBase().listen((event) {
      if (event != null) {
        getTopRatedMovieList = event;
      }
      notifyListeners();
    });

    ///listen Top Rated Movie List from DataBase
    _movieModel.getPopularMovieListFormDataBase().listen((event) {
      if (event != null) {
        getPopularMoviesList = event;
      }
      notifyListeners();
    });

    ///listen Actor List from DataBase
    _movieModel.getActorResultListFormDataBase().listen((event) {
      if (event != null) {
        actorsList = event;
      }
      notifyListeners();
    });
  }

  /// to check one color on  genres movie type list
  void checkColorGenresMovieType(GenresVO genresVO) {
    genresList = genresList.map((e) {
      if (e == genresVO) {
        e.isSelected = true;
      } else {
        e.isSelected = false;
      }
      return e;
    }).toList();
    notifyListeners();
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
