// import 'package:flutter/material.dart';
// import 'package:movie_app_project_test/constant/api_constant.dart';
// import 'package:movie_app_project_test/data/model/movie_model.dart';
// import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
// import 'package:movie_app_project_test/network/response/actor_detail_response/actor_detail_response.dart';
// import '../constant/dimens.dart';
// import '../view_items/actor_and_actress_info_page_view_items/actor_and_actress_info_page_view_items.dart';
// import '../widgets/sliverAppBar_ActorImage_widget.dart';
//
// class ActorDetailPage extends StatefulWidget {
//   const ActorDetailPage({Key? key, required this.movieId}) : super(key: key);
//   final int movieId;
//   @override
//   State<ActorDetailPage> createState() => _ActorDetailPageState();
// }
//
// class _ActorDetailPageState extends State<ActorDetailPage> {
//   MovieModel movieModel = MovieModelImpl();
//   ActorDetailResponse? getActorDetail;
//
//   @override
//   void initState() {
//     movieModel.getActorDetail(widget.movieId).then((value) {
//       setState(() {
//         getActorDetail = value;
//       });
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: ActorDetailView(
//           getActorDetail: getActorDetail,
//         ));
//   }
// }
//
// class ActorDetailView extends StatelessWidget {
//   const ActorDetailView({Key? key, required this.getActorDetail})
//       : super(key: key);
//   final ActorDetailResponse? getActorDetail;
//   @override
//   Widget build(BuildContext context) {
//     if (getActorDetail != null) {
//       return NestedScrollView(
//           floatHeaderSlivers: true,
//           headerSliverBuilder: (context, innerBoxIsScrolled) => [
//                 SliverAppBar(
//                     shape: const Border(bottom: BorderSide.none),
//                     pinned: true,
//                     floating: true,
//                     expandedHeight: kSP380x,
//                     backgroundColor: Colors.black,
//                     flexibleSpace: SliverAppBarActorImageDefaultWidget(
//                       imageURL:
//                           "$kNetWortPosterPath${getActorDetail?.profilePath ?? ''}",
//                       colorOpacityHeight: kSP350x,
//                       textForTitle: getActorDetail?.name ?? "",
//                     )),
//               ],
//           body: SingleChildScrollView(
//               child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               BiographyItemView(getActorDetail: getActorDetail),
//               MoreInformationItemView(actorDetail: getActorDetail),
//               KnownForItemView()
//             ],
//           )));
//     }
//     return const Center(child: CircularProgressIndicator());
//   }
// }
import 'package:flutter/material.dart';
import 'package:movie_app_project_test/data/model/movie_model.dart';
import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
import 'package:movie_app_project_test/network/response/actor_detail_response/actor_detail_response.dart';
import '../view_items/actor_and_actress_info_page_view_items/actor_and_actress_info_page_view_items.dart';

class ActorDetailPage extends StatefulWidget {
  const ActorDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<ActorDetailPage> createState() => _ActorDetailPageState();
}

class _ActorDetailPageState extends State<ActorDetailPage> {
  final MovieModel _movieModel = MovieModelImpl();
  ActorDetailResponse? actorDetail;
  List<MovieVO> movieList = [];

  @override
  void initState() {
    _movieModel.getActorDetail(widget.id);
    _movieModel.getActorDetailFormDataBase(widget.id).listen((event) {
      if (mounted) {
        setState(() {
          actorDetail = event;
        });
      }

      _movieModel.getNowPlayingMovieList();
      _movieModel.getNowPlayingMovieListFormDataBase().listen((event) {
        if (mounted) {
          setState(() {
            movieList = event ?? [];
          });
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ActorDetailItemView(
          actorDetail: actorDetail,
          knownForMovieList: movieList,
        ));
  }
}
