import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import '../data/model/movie_model.dart';
import 'package:flutter/foundation.dart';

import '../data/vos/search_movie_vo/search_movie_vo.dart';

class SearchMoviePageBloc extends ChangeNotifier {
  final MovieModel _movieModel = MovieModelImpl();
  bool isDispose = false;
  List<SearchMovieResultVO> searchMovieList = [];

  ///fetch network call for Search Movie list
  void searchMovieName(String name) {
    _movieModel.getSearchMovie(name).then((value) {
      if (value != null) {
        searchMovieList = value;
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
