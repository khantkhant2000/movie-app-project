import 'package:flutter/material.dart';
import 'package:movie_app_project_test/data/vos/crew_vo/hive_crew_vo.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/hive_similar_movie.dart';
import 'package:movie_app_project_test/widgets/is_loading_widget.dart';
import 'package:provider/provider.dart';
import '../../bloc/movie_detail_page_bloc.dart';
import '../../constant/api_constant.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../data/vos/cast-_vo/hive_cast_vo.dart';
import '../../network/response/movie_detail_response/movie_detail_response.dart';
import '../../widgets/ListTile_default_widget.dart';
import '../../widgets/back_arrow_icon_widget.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/movie_name_and_rating_widget.dart';
import '../../widgets/production_company_image_widget.dart';
import '../../widgets/sliverAppBar_movieImages_widget.dart';

class MovieDetailItemView extends StatelessWidget {
  const MovieDetailItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<MovieDetailPageBloc, MovieDetailResponse?>(
      selector: (_, bloc) => bloc.movieDetail,
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
              flexibleSpace: SliverAppBarMovieImageDefaultWidget(
                colorOpacityHeight: kSP350x,
                movieDetailResponse: bloc,
              )),
        ],
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoryLineItemView(movieDetailResponse: bloc),
            const StarCastItemView(),
            const TalentSquadItemView(),
            ProductionCompanyItemView(
              movieDetail: bloc,
            ),
            const RecommendedMovieItemView(),
          ],
        )),
      ),
    );
  }
}

///Story Line Session
class StoryLineItemView extends StatelessWidget {
  const StoryLineItemView({Key? key, required this.movieDetailResponse})
      : super(key: key);
  final MovieDetailResponse? movieDetailResponse;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP12x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: kSP20x, bottom: kSP10x),
            child: EasyText(
              text: kStoryLineText,
              fontSize: kFS18x,
            ),
          ),
          EasyText(
            text: movieDetailResponse?.overview ?? "",
            fontWeight: FontWeight.w300,
            fontSize: kFS13x,
          )
        ],
      ),
    );
  }
}

///Star Cast Session
class StarCastItemView extends StatelessWidget {
  const StarCastItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: kSP30x, bottom: kSP10x, left: kSP12x),
            child: EasyText(
              text: kStarCastText,
              fontSize: kFS18x,
            ),
          ),
          Selector<MovieDetailPageBloc, HiveCastVO?>(
              selector: (_, bloc) => bloc.getCastList,
              builder: (_, bloc, __) => (bloc == null)
                  ? const IsLoadingWidget()
                  : StarCastView(getCastList: bloc))
        ]);
  }
}

class StarCastView extends StatelessWidget {
  const StarCastView({Key? key, required this.getCastList}) : super(key: key);
  final HiveCastVO? getCastList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP80x,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getCastList?.getCastList?.length,
        itemBuilder: (context, index) {
          return ListTileDefault(
            imageURLForActor:
                '$kNetWortPosterPath${getCastList?.getCastList?[index].profilePath ?? ""}',
            actorName: getCastList?.getCastList?[index].name ?? "",
            genderId: getCastList?.getCastList?[index].gender ?? 0,
          );
        },
      ),
    );
  }
}

///Crew or Talent Squad Session
class TalentSquadItemView extends StatelessWidget {
  const TalentSquadItemView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: kSP10x, left: kSP12x),
          child: EasyText(
            text: kTalentSquadText,
            fontSize: kFS18x,
          ),
        ),
        Selector<MovieDetailPageBloc, HiveCrewVO?>(
          selector: (_, bloc) => bloc.getCrewList,
          builder: (_, bloc, __) => (bloc == null)
              ? const IsLoadingWidget()
              : SizedBox(
                  height: kSP80x, child: TalentSquadView(getCrewList: bloc)),
        )
      ],
    );
  }
}

class TalentSquadView extends StatelessWidget {
  const TalentSquadView({Key? key, required this.getCrewList})
      : super(key: key);
  final HiveCrewVO? getCrewList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: getCrewList?.crewList?.length,
      itemBuilder: (context, index) {
        return ListTileDefault(
          imageURLForActor:
              '$kNetWortPosterPath${getCrewList?.crewList?[index].profilePath ?? ""}',
          actorName: getCrewList?.crewList?[index].name ?? '',
          genderId: getCrewList?.crewList?[index].id ?? 0,
        );
      },
    );
  }
}

///Production Company Session
class ProductionCompanyItemView extends StatelessWidget {
  const ProductionCompanyItemView({
    Key? key,
    required this.movieDetail,
  }) : super(key: key);
  final MovieDetailResponse? movieDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: kSP10x, left: kSP12x),
          child: EasyText(
            text: kProductionCompanyText,
            fontSize: kFS18x,
          ),
        ),
        SizedBox(
          height: kSP130x,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieDetail?.productionCompanies?.length,
            itemBuilder: (context, index) {
              return PCWidget(
                imageURL:
                    '$kNetWortPosterPath${movieDetail?.productionCompanies?[index].logoPath ?? ''}',
                name: movieDetail?.productionCompanies?[index].name ?? '',
              );
            },
          ),
        )
      ],
    );
  }
}

///Similar Movie or Recommended Session
class RecommendedMovieItemView extends StatelessWidget {
  const RecommendedMovieItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<MovieDetailPageBloc, HiveSimilarMovieVO?>(
        selector: (_, bloc) => bloc.getSimilarMovieList,
        builder: (_, bloc, __) => (bloc == null)
            ? const IsLoadingWidget()
            : RecommendedMovieView(
                getSimilarMovieList: bloc,
              ));
  }
}

class RecommendedMovieView extends StatelessWidget {
  const RecommendedMovieView({
    Key? key,
    required this.getSimilarMovieList,
  }) : super(key: key);
  final HiveSimilarMovieVO? getSimilarMovieList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: kSP30x, bottom: kSP10x, left: kSP12x),
          child: EasyText(
            text: kRecommendedText,
            fontSize: kFS18x,
          ),
        ),
        SizedBox(
          height: kSP230x,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: getSimilarMovieList?.similarMovieList?.length,
            itemBuilder: (context, index) {
              return MovieNameAndRatingView(
                movieId: getSimilarMovieList?.similarMovieList?[index].id ?? 0,
                heightForColorOpacity: kSP230x,
                imageURL:
                    getSimilarMovieList?.similarMovieList?[index].posterPath ??
                        "",
                textForRating:
                    getSimilarMovieList?.similarMovieList?[index].voteAverage ??
                        0,
                movieName:
                    getSimilarMovieList?.similarMovieList?[index].title ?? "",
                textForVotes:
                    getSimilarMovieList?.similarMovieList?[index].voteCount ??
                        0,
                heightForImage: kSP220x,
                widthForImage: kSP180x,
              );
            },
          ),
        )
      ],
    );
  }
}
