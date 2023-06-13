import '../../data/vos/crew_vo/crew_vo.dart';

abstract class CrewDAO {
  void saveForCrewVO(List<CrewVO> crewList);
  List<CrewVO>? getCrewListFromDataBase();

  Stream watchCrewBox();
  Stream<List<CrewVO>?> getCrewListFromDataBaseStream();
}
