import 'package:movie_app_project_test/data/vos/known_for_vo/hive_known_for_vo.dart';

abstract class KnownForDAO {
  void saveForKnownForMovie(int movieID, HiveKnownForVO knownForVO);
  HiveKnownForVO? getKnownForMovieListFromDataBase(int movieID);

  Stream watchKnownForMovieBox();
  Stream<HiveKnownForVO?> getKnownForMovieListFromDataBaseStream(int movieID);
}
