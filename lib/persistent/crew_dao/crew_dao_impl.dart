import 'package:hive/hive.dart';
import '../../constant/hive_constant.dart';
import '../../data/vos/crew_vo/hive_crew_vo.dart';
import 'crew_dao.dart';

class CrewDAOImpl extends CrewDAO {
  CrewDAOImpl._();
  static final CrewDAOImpl _singleton = CrewDAOImpl._();
  factory CrewDAOImpl() => _singleton;

  Box<HiveCrewVO> _hiveCrewBox() => Hive.box<HiveCrewVO>(kBoxNameForCrew);

  @override
  HiveCrewVO? getCrewListFromDataBase(int movieID) =>
      _hiveCrewBox().get(movieID);

  @override
  Stream<HiveCrewVO?> getCrewListFromDataBaseStream(int movieID) =>
      Stream.value(getCrewListFromDataBase(movieID));

  @override
  void saveForCrewVO(int movieID, HiveCrewVO crewList) =>
      _hiveCrewBox().put(movieID, crewList);

  @override
  Stream watchCrewBox() => _hiveCrewBox().watch();
}
