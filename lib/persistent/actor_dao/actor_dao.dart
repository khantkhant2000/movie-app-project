import '../../data/vos/actor_result_vo/actor_result_vo.dart';

abstract class ActorsDAO {
  void saveForActor(List<ActorResultsVO> actorsList);

  List<ActorResultsVO>? getActorsResultListFromDataBase();

  Stream watchActorResults();

  Stream<List<ActorResultsVO>?> getActorsResultListFromDataBaseStream();
}
