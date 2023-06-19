import '../../data/vos/cast-_vo/hive_cast_vo.dart';

abstract class CastDAO {
  void saveForCastVO(int movieID, HiveCastVO castList);

  HiveCastVO? getCastListFromDataBase(int movieID);

  Stream watchCastBox();

  Stream<HiveCastVO?> getCastListFromDataBaseStream(int movieID);
}
