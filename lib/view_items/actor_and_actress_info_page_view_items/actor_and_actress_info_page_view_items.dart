import 'package:flutter/material.dart';
import '../../constant/api_constant.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../data/vos/movie_vo/result_vo.dart';
import '../../network/response/actor_detail_response/actor_detail_response.dart';
import '../../widgets/back_arrow_icon_widget.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/moreInformationSpecific_view_widget.dart';
import '../../widgets/movie_name_and_rating_widget.dart';
import '../../widgets/sliverAppBar_ActorImage_widget.dart';
import '../../widgets/textAndMyDivider_widget.dart';

class ActorDetailItemView extends StatelessWidget {
  const ActorDetailItemView({
    Key? key,
    required this.actorDetail,
    required this.knownForMovieList,
  }) : super(key: key);
  final ActorDetailResponse? actorDetail;
  final List<MovieVO> knownForMovieList;

  @override
  Widget build(BuildContext context) {
    if (actorDetail != null) {
      return NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
              leading: const BackArrowIconWidget(),
              automaticallyImplyLeading: false,
              shape: const Border(bottom: BorderSide.none),
              pinned: true,
              floating: true,
              expandedHeight: kSP370x,
              backgroundColor: kSliverAppBarBackgroundColor,
              flexibleSpace: SliverAppBarActorImageDefaultWidget(
                textForTitle: actorDetail?.name ?? '',
                imageURL:
                    "$kNetWortPosterPath${actorDetail?.profilePath ?? ''}",
                colorOpacityHeight: kSP350x,
              )),
        ],
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BiographyItemView(getActorDetail: actorDetail),
            MoreInformationItemView(actorDetail: actorDetail),
            KnownForItemView(
              movieList: knownForMovieList,
            )
          ],
        )),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }
}

///Actors and Actress Biography Session
class BiographyItemView extends StatelessWidget {
  const BiographyItemView({
    Key? key,
    required this.getActorDetail,
  }) : super(key: key);
  final ActorDetailResponse? getActorDetail;
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
            text: getActorDetail?.biography ?? "",
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}

///More Information Session
class MoreInformationItemView extends StatelessWidget {
  const MoreInformationItemView({
    Key? key,
    required this.actorDetail,
  }) : super(key: key);
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
    required this.movieList,
  }) : super(key: key);

  final List<MovieVO> movieList;
  @override
  Widget build(BuildContext context) {
    return movieList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : KnownForView(
            knownForMovieList: movieList,
          );
  }
}

class KnownForView extends StatelessWidget {
  const KnownForView({Key? key, required this.knownForMovieList})
      : super(key: key);
  final List<MovieVO> knownForMovieList;
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
              return MovieNameAndRatingView(
                movieId: knownForMovieList[index].id ?? 0,
                heightForColorOpacity: kSP230x,
                imageURL: knownForMovieList[index].posterPath ?? "",
                textForRating: knownForMovieList[index].voteAverage ?? 0,
                movieName: knownForMovieList[index].title ?? "",
                textForVotes: knownForMovieList[index].voteCount ?? 0,
                heightForImage: kSP300x,
                widthForImage: kSP200x,
              );
            },
          ),
        ),
      ],
    );
  }
}
