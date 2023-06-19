import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/actor_detail_page_bloc.dart';
import '../view_items/actor_and_actress_info_page_view_items/actor_and_actress_info_page_view_items.dart';

class ActorDetailPage extends StatelessWidget {
  const ActorDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActorDetailPageBloc>(
        create: (context) => ActorDetailPageBloc(id),
        builder: (context, _) {
          return const Scaffold(
              backgroundColor: Colors.black, body: ActorDetailItemView());
        });
  }
}
