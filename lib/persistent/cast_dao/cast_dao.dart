import '../../data/vos/cast-_vo/cast_vo.dart';

abstract class CastDAO {
  void saveForCastVO(List<CastVO> castList);
  List<CastVO>? getCastListFromDataBase();

  Stream watchCastBox();
  Stream<List<CastVO>?> getCastListFromDataBaseStream();
}
