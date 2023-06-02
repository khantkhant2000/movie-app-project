import 'package:flutter/material.dart';
import 'package:movie_app_project_test/data/model/movie_model.dart';
import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../data/vos/movie_vo/result_vo.dart';
import '../../network/response/actor_detail_response/actor_detail_response.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/moreInformationSpecific_view_widget.dart';
import '../../widgets/movie_name_and_rating_widget.dart';
import '../../widgets/textAndMyDivider_widget.dart';

MovieModel _movieModel = MovieModelImpl();

class BiographyItemView extends StatelessWidget {
  const BiographyItemView({
    Key? key,
    required this.getActorDetail,
  }) : super(key: key);
  final ActorDetailResponse? getActorDetail;
  @override
  Widget build(BuildContext context) {
    return BiographyView(
      actorDetail: getActorDetail,
    );
  }
}

class BiographyView extends StatelessWidget {
  const BiographyView({Key? key, this.actorDetail}) : super(key: key);
  final ActorDetailResponse? actorDetail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSP40x, horizontal: kSP10x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleTextAndMyDividerWidget(titleText: kBiographyText),
          const SizedBox(height: kSP10x),
          EasyText(
            text: actorDetail?.biography ?? "",
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}

class MoreInformationItemView extends StatelessWidget {
  const MoreInformationItemView({
    Key? key,
    required this.actorDetail,
  }) : super(key: key);
  final ActorDetailResponse? actorDetail;
  @override
  Widget build(BuildContext context) {
    return MoreInformationView(
      actorDetail: actorDetail,
    );
  }
}

class MoreInformationView extends StatelessWidget {
  const MoreInformationView({Key? key, this.actorDetail}) : super(key: key);
  final ActorDetailResponse? actorDetail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSP10x, bottom: kSP30x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleTextAndMyDividerWidget(titleText: kMoreInformationText),
          const SizedBox(height: kSP10x),
          MoreInformationSpecificViewWidget(
            birthday: actorDetail?.birthday ?? "",
            gender: actorDetail?.gender ?? 0,
            placeOfBirth: actorDetail?.placeOfBirth ?? "",
            popularity: actorDetail?.popularity ?? 0,
          ),
        ],
      ),
    );
  }
}

class KnownForItemView extends StatelessWidget {
  const KnownForItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieVO>?>(
      future: _movieModel.getMovieList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          debugPrint("Error Fetching");
        }
        final movieList = snapshot.data;
        return KnownForView(
          topRatedMovies: movieList,
        );
      },
    );
  }
}

class KnownForView extends StatelessWidget {
  const KnownForView({Key? key, required this.topRatedMovies})
      : super(key: key);
  final List<MovieVO>? topRatedMovies;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kSP10x),
          child: TitleTextAndMyDividerWidget(titleText: kKnownForText),
        ),
        SizedBox(
          height: kSP300x,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 400,
                child: MovieNameAndRatingView(
                  movieId: topRatedMovies?[index].id ?? 0,
                  heightForColorOpacity: kSP230x,
                  imageURL: topRatedMovies?[index].posterPath ?? "",
                  textForRating: topRatedMovies?[index].voteAverage ?? 0,
                  movieName: topRatedMovies?[index].title ?? "",
                  textForVotes: topRatedMovies?[index].voteCount ?? 0,
                  widthForImage: kSP250x,
                  height: kSP300x,
                  width: kSP200x,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
