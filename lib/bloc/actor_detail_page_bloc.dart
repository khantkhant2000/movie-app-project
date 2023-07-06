import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import 'package:movie_app_project_test/data/vos/known_for_vo/known_for_vo.dart';
import '../data/model/movie_model.dart';
import 'package:flutter/foundation.dart';
import '../network/response/actor_detail_response/actor_detail_response.dart';

class ActorDetailPageBloc extends ChangeNotifier {
  bool isDispose = false;
  final MovieModel _movieModel = MovieModelImpl();
  ActorDetailResponse? actorDetail;
  List<KnownForVO> movieList = [];

  ActorDetailPageBloc(int actorID) {
    ///fetch network call for actor detail
    _movieModel.getActorDetail(actorID);

    ///fetch network call for known for movie list
    // _movieModel.getActorsList();

    /*-----------------------------------------*/

    ///listen actor detail from data base
    _movieModel.getActorDetailFormDataBase(actorID).listen((event) {
      if (event != null) {
        actorDetail = event;
      }
      notifyListeners();
    });

    //listen known for movie list from data base
    // _movieModel.getActorResultListFormDataBase().listen((event) {
    //   if (event != null) {
    //     movieList = event;
    //   }
    //   notifyListeners();
    // });
  }

  @override
  void notifyListeners() {
    if (!isDispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDispose = true;
  }
}
