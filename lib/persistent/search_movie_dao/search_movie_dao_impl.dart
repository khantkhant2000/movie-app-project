import 'package:hive/hive.dart';
import 'package:movie_app_project_test/constant/hive_constant.dart';
import 'package:movie_app_project_test/data/vos/search_movie_vo/search_movie_vo.dart';
import 'package:movie_app_project_test/persistent/search_movie_dao/search_movie_dao.dart';

class SearchMovieDAOImpl extends SearchMovieDAO {
  SearchMovieDAOImpl._();
  static final SearchMovieDAOImpl _singleton = SearchMovieDAOImpl._();
  factory SearchMovieDAOImpl() => _singleton;

  @override
  List<SearchMovieResultVO>? getSearchMovieListFromDataBase() =>
      _searchMovieBox().values.toList();

  @override
  Stream<List<SearchMovieResultVO>?> getSearchMovieListFromDataBaseStream() =>
      Stream.value(getSearchMovieListFromDataBase());

  @override
  void saveForSearchMovieList(List<SearchMovieResultVO> searchMovieList) {
    for (SearchMovieResultVO searchMovieVO in searchMovieList) {
      _searchMovieBox().put(searchMovieVO.id, searchMovieVO);
    }
  }

  @override
  Stream watchSearchMovieList() => _searchMovieBox().watch();
  Box<SearchMovieResultVO> _searchMovieBox() =>
      Hive.box<SearchMovieResultVO>(kBoxNameForSearchMovie);
}
