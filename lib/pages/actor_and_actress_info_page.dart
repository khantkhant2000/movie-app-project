import 'package:flutter/material.dart';
import 'package:movie_app_project_test/data/vos/known_for_vo/known_for_vo.dart';
import 'package:provider/provider.dart';
import '../bloc/actor_detail_page_bloc.dart';
import '../view_items/actor_and_actress_info_page_view_items/actor_and_actress_info_page_view_items.dart';

class ActorDetailPage extends StatelessWidget {
  const ActorDetailPage({
    Key? key,
    required this.id,
    required this.movieList,
  }) : super(key: key);
  final int id;
  final List<KnownForVO> movieList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActorDetailPageBloc>(
        create: (context) => ActorDetailPageBloc(id),
        builder: (context, widget) {
          return Scaffold(
              backgroundColor: Colors.black,
              body: ActorDetailItemView(knownForMovieList: movieList));
        });
  }
}
