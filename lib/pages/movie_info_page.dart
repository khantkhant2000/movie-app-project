import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../view_items/moive_info_page-view_items/movie_info_page_view_items.dart';
import '../widgets/sliverAppBar_movieImages_widget.dart';

class MovieInfoPage extends StatelessWidget {
  const MovieInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
                shape: Border(bottom: BorderSide.none),
                pinned: true,
                floating: true,
                expandedHeight: kSP370x,
                backgroundColor: kSliverAppBarBackgroundColor,
                flexibleSpace: SliverAppBarMovieImageDefaultWidget(
                  textForTitle: kIronMan3Text,
                  imageURL: kIronMan3ImageURL,
                  colorOpacityHeight: kSP350x,
                )),
          ],
          body: const SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoryLineItemView(),
              StarCastItemView(),
              TalentSquadItemView(),
              ProductionCompanyItemView(),
              RecommendedMovieItemView(),
            ],
          )),
        ));
  }
}
