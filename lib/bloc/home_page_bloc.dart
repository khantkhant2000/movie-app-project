import 'package:flutter/material.dart';
import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/hive_movie_by_genres_id.dart';
import '../data/model/movie_model.dart';
import '../data/vos/actor_result_vo/actor_result_vo.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import '../data/vos/movie_vo/result_vo.dart';

class HomePageBloc extends ChangeNotifier {
  final MovieModel _movieModel = MovieModelImpl();
  final ScrollController controllerForTopRatedMovie = ScrollController();
  final ScrollController controllerForPopularMovie = ScrollController();
  int pageCountForTopRatedMovie = 1;
  int pageCountForPopularMovie = 1;
  int movieByGenresID = 12;

  bool isDispose = false;

  List<GenresVO> genresList = [];
  List<MovieVO> getNowPlayingMovieList = [];
  List<MovieVO> getTopRatedMovieList = [];
  List<MovieVO> getPopularMoviesList = [];
  HiveMovieByGenresIDVO? getMoviesListByGenres;
  List<ActorResultsVO> actorsList = [];

  HomePageBloc() {
    ///fetch NetWork Call for Genres list
    _movieModel.getGenresList();

    ///fetch network call for getNowPlaying Movie (Carousel Slider & Get Now Playing Movie)
    // _movieModel.getNowPlayingMovieList();

    ///fetch network call for Top Rated Movie
    _movieModel.getTopRateMovieList(pageCountForTopRatedMovie);

    ///fetch network call for Popular Movie
    _movieModel.getPopularMovieList(pageCountForPopularMovie);

    ///fetch network call for Top Rated Movie
    _movieModel.getActorsList();

    ///fetch network call for get Movie by Genres (Carousel Slider & Get Now Playing Movie)
    _movieModel.getMovieByGenres(movieByGenresID);

    /*-------------------------------------------------------------------------*/

    ///Listen Genres List From DataBase
    _movieModel.getGenresListFromDataBase().listen((event) {
      if (event != null) {
        genresList = event;
        if (genresList.isNotEmpty) {
          final firstData = genresList.first;
          firstData.isSelected = true;
          genresList.removeAt(0);
          genresList.insert(0, firstData);
        }
      }
      notifyListeners();
    });

    ///listen getNowPlaying Movie List from DataBase ( Carousel Slider & Get Now Playing Movie )
    // _movieModel.getNowPlayingMovieListFormDataBase().listen((event) {
    //   if (event != null) {
    //     getNowPlayingMovieList = event;
    //   }
    //   notifyListeners();
    // });

    ///listen Top Rated Movie List from DataBase
    _movieModel.getTopRatedMovieListFormDataBase().listen((event) {
      if (event != null) {
        getTopRatedMovieList = event;
      }
      notifyListeners();
    });

    ///listen Popular Movie List from DataBase
    _movieModel.getPopularMovieListFormDataBase().listen((event) {
      if (event != null) {
        getPopularMoviesList = event;
      }
      notifyListeners();
    });

    ///listen get Movie List By Genres from DataBase ( Carousel Slider & Get Now Playing Movie )
    _movieModel.getMovieByGenresIDFromDataBase(movieByGenresID).listen((event) {
      if (event != null) {
        getMoviesListByGenres = event;
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

    /// listen Top Rated Movie for Scrolling
    controllerForTopRatedMovie.addListener(() {
      if (controllerForTopRatedMovie.position.atEdge) {
        double pixels = controllerForTopRatedMovie.position.pixels;
        pageCountForTopRatedMovie++;
        if (pixels != 0) {
          _movieModel.getTopRateMovieList(pageCountForTopRatedMovie);
        }
      }
    });

    /// listen Popular Movie for Scrolling
    controllerForPopularMovie.addListener(() {
      if (controllerForPopularMovie.position.atEdge) {
        double pixels = controllerForTopRatedMovie.position.pixels;
        pageCountForPopularMovie++;
        if (pixels != 0) {
          _movieModel.getPopularMovieList(pageCountForPopularMovie);
        }
      }
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
    controllerForPopularMovie.dispose();
    controllerForTopRatedMovie.dispose();
  }
}
