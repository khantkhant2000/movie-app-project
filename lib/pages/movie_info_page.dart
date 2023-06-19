import 'package:flutter/material.dart';
import 'package:movie_app_project_test/bloc/movie_datail_page_bloc.dart';
import 'package:provider/provider.dart';
import '../view_items/moive_info_page-view_items/movie_info_page_view_items.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    Key? key,
    required this.movieId,
  }) : super(key: key);
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieDetailPageBloc>(
      create: (context) => MovieDetailPageBloc(movieId),
      builder: (context, _) => const Scaffold(
          backgroundColor: Colors.black, body: MovieDetailItemView()),
    );
  }
}
