import '../../data/vos/genres_vo/genres_vo.dart';

abstract class GenresDAO {
  void saveForGenresList(List<GenresVO> genresList);

  List<GenresVO>? getGenresListFromDataBase();

  Stream watchGenresBox();

  Stream<List<GenresVO>?> getGenresListFromDataBaseStream();
}
