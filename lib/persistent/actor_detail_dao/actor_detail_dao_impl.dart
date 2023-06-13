import 'package:hive/hive.dart';
import 'package:movie_app_project_test/network/response/actor_detail_response/actor_detail_response.dart';

import '../../constant/hive_constant.dart';
import 'actor_detail_dao.dart';

class ActorDetailDAOImpl extends ActorDetailDAO {
  ActorDetailDAOImpl._();
  static final ActorDetailDAOImpl _singleton = ActorDetailDAOImpl._();
  factory ActorDetailDAOImpl() => _singleton;

  Box<ActorDetailResponse> _actorsDetailBox() =>
      Hive.box<ActorDetailResponse>(kBoxNameForActorDetail);

  @override
  ActorDetailResponse? getActorDetailFromDataBaseByID(int actorID) =>
      _actorsDetailBox().get(actorID);

  @override
  Stream<ActorDetailResponse?> getActorDetailFromDataBaseStreamByID(
          int actorID) =>
      Stream.value(getActorDetailFromDataBaseByID(actorID));

  @override
  void saveForActorDetail(ActorDetailResponse actorDetail) {
    _actorsDetailBox().put(actorDetail.id, actorDetail);
  }

  @override
  Stream watchActorsBox() => _actorsDetailBox().watch();
}
