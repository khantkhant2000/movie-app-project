import 'package:movie_app_project_test/data/vos/crew_vo/hive_crew_vo.dart';

abstract class CrewDAO {
  void saveForCrewVO(int movieID, HiveCrewVO crewList);
  HiveCrewVO? getCrewListFromDataBase(int movieID);

  Stream watchCrewBox();
  Stream<HiveCrewVO?> getCrewListFromDataBaseStream(int movieID);
}
