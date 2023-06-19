import 'package:flutter/material.dart';
import 'package:movie_app_project_test/bloc/home_page_bloc.dart';
import 'package:provider/provider.dart';
import '../constant/colors.dart';
import '../view_items/home_page_view_items/home_page_view_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageBloc>(
      create: (context) => HomePageBloc(),
      builder: (context, _) {
        return Scaffold(
            backgroundColor: kAppBodyBackgroundColor,
            body: const SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchBarAndSearchIconItemView(),
                  MovieTypeScrollItemView(),
                  CarouselSliderImageItemView(),
                  MovieNameAndRatingItemView(),
                  YouMayLikeTextView(),
                  YouMayLikeMovieItemView(),
                  PopularTextView(),
                  PopularMovieItemView(),
                  ActorAndActressItemView(),
                ],
              ),
            ));
      },
    );
  }
}
