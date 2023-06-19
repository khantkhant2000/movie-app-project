import 'package:hive/hive.dart';
import 'package:movie_app_project_test/data/vos/known_for_vo/hive_known_for_vo.dart';

import '../../constant/hive_constant.dart';
import 'known_for_dao.dart';

class KnownForDAOImpl extends KnownForDAO {
  KnownForDAOImpl._();
  static final KnownForDAOImpl _singleton = KnownForDAOImpl._();
  factory KnownForDAOImpl() => _singleton;

  @override
  HiveKnownForVO? getKnownForMovieListFromDataBase(int movieID) =>
      _knownForMovieBox().get(movieID);

  @override
  Stream<HiveKnownForVO?> getKnownForMovieListFromDataBaseStream(int movieID) =>
      Stream.value(getKnownForMovieListFromDataBase(movieID));

  @override
  void saveForKnownForMovie(int movieID, HiveKnownForVO knownForVO) =>
      _knownForMovieBox().put(movieID, knownForVO);

  @override
  Stream watchKnownForMovieBox() => _knownForMovieBox().watch();

  Box<HiveKnownForVO> _knownForMovieBox() =>
      Hive.box<HiveKnownForVO>(kBoxNameForHiveKnownForMovieVO);
}
