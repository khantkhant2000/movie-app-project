import 'package:hive/hive.dart';
import 'package:movie_app_project_test/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_app_project_test/persistent/genres_dao/genres_dao.dart';

import '../../constant/hive_constant.dart';

class GenresDAOImpl extends GenresDAO {
  GenresDAOImpl._();
  static final GenresDAOImpl _singleton = GenresDAOImpl._();
  factory GenresDAOImpl() => _singleton;
  @override
  List<GenresVO>? getGenresListFromDataBase() => _genresBox().values.toList();

  @override
  void saveForGenresList(List<GenresVO> genresList) {
    for (GenresVO genres in genresList) {
      _genresBox().put(genres.id, genres);
    }
  }

  @override
  Stream<List<GenresVO>?> getGenresListFromDataBaseStream() =>
      Stream.value(getGenresListFromDataBase());

  @override
  Stream watchGenresBox() => _genresBox().watch();

  Box<GenresVO> _genresBox() => Hive.box<GenresVO>(kBoxNameForGenres);
}
