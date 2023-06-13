import 'package:hive/hive.dart';
import 'package:movie_app_project_test/data/vos/actor_result_vo/actor_result_vo.dart';
import 'package:movie_app_project_test/persistent/actor_dao/actor_dao.dart';
import '../../constant/hive_constant.dart';

class ActorsDAOImpl extends ActorsDAO {
  ActorsDAOImpl._();
  static final ActorsDAOImpl _singleton = ActorsDAOImpl._();
  factory ActorsDAOImpl() => _singleton;

  @override
  void saveForActor(List<ActorResultsVO> actorsList) {
    for (ActorResultsVO actor in actorsList) {
      _actorResultBox().put(actor.id, actor);
    }
  }

  @override
  List<ActorResultsVO>? getActorsResultListFromDataBase() =>
      _actorResultBox().values.toList();

  @override
  Stream watchActorResults() => _actorResultBox().watch();

  @override
  Stream<List<ActorResultsVO>?> getActorsResultListFromDataBaseStream() =>
      Stream.value(getActorsResultListFromDataBase());

  Box<ActorResultsVO> _actorResultBox() =>
      Hive.box<ActorResultsVO>(kBoxNameForActorResult);
}
