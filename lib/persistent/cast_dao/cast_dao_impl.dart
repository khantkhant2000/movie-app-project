import 'package:hive/hive.dart';
import 'package:movie_app_project_test/data/vos/cast-_vo/cast_vo.dart';

import '../../constant/hive_constant.dart';
import 'cast_dao.dart';

class CastDAOImpl extends CastDAO {
  CastDAOImpl._();
  static final CastDAOImpl _singleton = CastDAOImpl._();
  factory CastDAOImpl() => _singleton;

  Box<CastVO> _castBox() => Hive.box<CastVO>(kBoxNameForCast);

  @override
  List<CastVO>? getCastListFromDataBase() => _castBox().values.toList();

  @override
  Stream<List<CastVO>?> getCastListFromDataBaseStream() =>
      Stream.value(getCastListFromDataBase());

  @override
  void saveForCastVO(List<CastVO> castList) {
    for (CastVO castVO in castList) {
      _castBox().put(castVO.id, castVO);
    }
  }

  @override
  Stream watchCastBox() => _castBox().watch();
}
