import '../../network/response/actor_detail_response/actor_detail_response.dart';

abstract class ActorDetailDAO {
  void saveForActorDetail(ActorDetailResponse actorDetail);
  ActorDetailResponse? getActorDetailFromDataBaseByID(int actorID);

  Stream watchActorsBox();
  Stream<ActorDetailResponse?> getActorDetailFromDataBaseStreamByID(
      int actorID);
}
