import 'package:hive/hive.dart';
import '../../constant/hive_constant.dart';
import '../../data/vos/cast-_vo/hive_cast_vo.dart';
import 'cast_dao.dart';

class CastDAOImpl extends CastDAO {
  CastDAOImpl._();
  static final CastDAOImpl _singleton = CastDAOImpl._();
  factory CastDAOImpl() => _singleton;

  Box<HiveCastVO> _castBox() => Hive.box<HiveCastVO>(kBoxNameForCast);

  @override
  Stream<HiveCastVO?> getCastListFromDataBaseStream(int movieID) =>
      Stream.value(getCastListFromDataBase(movieID));

  @override
  Stream watchCastBox() => _castBox().watch();

  @override
  void saveForCastVO(int movieID, HiveCastVO castList) {
    _castBox().put(movieID, castList);
  }

  @override
  HiveCastVO? getCastListFromDataBase(int movieID) => _castBox().get(movieID);
}
