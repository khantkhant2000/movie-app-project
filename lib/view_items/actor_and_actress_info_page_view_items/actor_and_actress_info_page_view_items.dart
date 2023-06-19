import 'package:flutter/material.dart';
import 'package:movie_app_project_test/widgets/is_loading_widget.dart';
import 'package:provider/provider.dart';
import '../../bloc/actor_detail_page_bloc.dart';
import '../../constant/api_constant.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../data/vos/actor_result_vo/actor_result_vo.dart';
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ActorDetailPageBloc, ActorDetailResponse?>(
        selector: (_, bloc) => bloc.actorDetail,
        builder: (_, bloc, __) => NestedScrollView(
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
                      textForTitle: bloc?.name ?? '',
                      imageURL: "$kNetWortPosterPath${bloc?.profilePath ?? ''}",
                      colorOpacityHeight: kSP350x,
                    )),
              ],
              body: SingleChildScrollView(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BiographyItemView(getActorDetail: bloc),
                  MoreInformationItemView(actorDetail: bloc),
                  const KnownForItemView()
                ],
              )),
            ));
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

///known for movie session
class KnownForItemView extends StatelessWidget {
  const KnownForItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ActorDetailPageBloc, List<ActorResultsVO>?>(
        selector: (_, bloc) => bloc.movieList,
        builder: (_, bloc, __) => (bloc == null)
            ? const IsLoadingWidget()
            : KnownForView(movieList: bloc));
  }
}

class KnownForView extends StatelessWidget {
  const KnownForView({
    Key? key,
    required this.movieList,
  }) : super(key: key);
  final List<ActorResultsVO> movieList;
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
                movieId: movieList[index].knownFor?[index].id ?? 0,
                heightForColorOpacity: kSP230x,
                imageURL: movieList[index].knownFor?[index].posterPath ?? "",
                textForRating:
                    movieList[index].knownFor?[index].voteAverage ?? 0,
                movieName: movieList[index].knownFor?[index].title ?? "",
                textForVotes: movieList[index].knownFor?[index].voteCount ?? 0,
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
