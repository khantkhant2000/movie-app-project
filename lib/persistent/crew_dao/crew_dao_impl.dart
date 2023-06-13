import 'package:hive/hive.dart';
import '../../constant/hive_constant.dart';
import '../../data/vos/crew_vo/crew_vo.dart';
import 'crew_dao.dart';

class CrewDAOImpl extends CrewDAO {
  CrewDAOImpl._();
  static final CrewDAOImpl _singleton = CrewDAOImpl._();
  factory CrewDAOImpl() => _singleton;

  Box<CrewVO> _crewBox() => Hive.box<CrewVO>(kBoxNameForCrew);

  @override
  List<CrewVO>? getCrewListFromDataBase() => _crewBox().values.toList();

  @override
  Stream<List<CrewVO>?> getCrewListFromDataBaseStream() =>
      Stream.value(getCrewListFromDataBase());

  @override
  void saveForCrewVO(List<CrewVO> crewList) {
    for (CrewVO crewVO in crewList) {
      _crewBox().put(crewVO.id, crewVO);
    }
  }

  @override
  Stream watchCrewBox() => _crewBox().watch();
}
