import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/search_movie_page_bloc.dart';
import '../constant/colors.dart';
import '../view_items/search_movie_page_view_items/search_movie_page_view_items.dart';

class SearchMoviePage extends StatelessWidget {
  const SearchMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchMoviePageBloc>(
      create: (context) => SearchMoviePageBloc(),
      builder: (context, _) => Scaffold(
        backgroundColor: kAppBodyBackgroundColor,
        body: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackTextItemView(),
            Expanded(child: SearchMoviesTextFieldItemView()),
          ],
        ),
      ),
    );
  }
}
