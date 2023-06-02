import 'package:flutter/material.dart';
import '../../constant/api_constant.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../data/model/movie_model.dart';
import '../../data/model/movie_model_impl.dart';
import '../../data/vos/cast-_vo/cast_vo.dart';
import '../../data/vos/crew_vo/crew_vo.dart';
import '../../data/vos/movie_vo/result_vo.dart';
import '../../data/vos/production_companies_vo/production_companies_vo.dart';
import '../../network/response/movie_detail_response/movie_detail_response.dart';
import '../../widgets/ListTile_default_widget.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/movie_name_and_rating_widget.dart';
import '../../widgets/production_company_image_widget.dart';

MovieModel _movieModel = MovieModelImpl();

class StoryLineItemView extends StatelessWidget {
  const StoryLineItemView({Key? key, required this.movieId}) : super(key: key);
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetailResponse?>(
      future: _movieModel.getMovieDetail(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          debugPrint("error fetching");
        }
        final movieDetail = snapshot.data;
        return StoryLineView(movieDetailResponse: movieDetail);
      },
    );
  }
}

class StoryLineView extends StatelessWidget {
  const StoryLineView({Key? key, required this.movieDetailResponse})
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

class StarCastItemView extends StatelessWidget {
  const StarCastItemView({
    Key? key,
    required this.castList,
  }) : super(key: key);
  final List<CastVO> castList;

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
          StarCastView(getCastList: castList)
        ]);
  }
}

class StarCastView extends StatelessWidget {
  const StarCastView({Key? key, required this.getCastList}) : super(key: key);
  final List<CastVO> getCastList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP80x,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getCastList.length,
        itemBuilder: (context, index) {
          return ListTileDefault(
            imageURLForActor:
                '$kNetWortPosterPath${getCastList[index].profilePath ?? ""}',
            actorName: getCastList[index].name ?? "",
            genderId: getCastList[index].gender ?? 0,
          );
        },
      ),
    );
  }
}

class TalentSquadItemView extends StatelessWidget {
  const TalentSquadItemView({
    Key? key,
    required this.getCrewList,
  }) : super(key: key);
  final List<CrewVO>? getCrewList;

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
        SizedBox(
            height: kSP80x,
            child: TalentSquadView(getCrewList: getCrewList ?? []))
      ],
    );
  }
}

class TalentSquadView extends StatelessWidget {
  const TalentSquadView({Key? key, required this.getCrewList})
      : super(key: key);
  final List<CrewVO> getCrewList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: getCrewList.length,
      itemBuilder: (context, index) {
        return ListTileDefault(
          imageURLForActor:
              '$kNetWortPosterPath${getCrewList[index].profilePath ?? ""}',
          actorName: getCrewList[index].name ?? '',
          genderId: getCrewList[index].id ?? 0,
        );
      },
    );
  }
}

class ProductionCompanyItemView extends StatelessWidget {
  const ProductionCompanyItemView({
    Key? key,
    required this.productionCompaniesList,
  }) : super(key: key);
  final List<ProductionCompaniesVO> productionCompaniesList;

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
            itemCount: productionCompaniesList.length,
            itemBuilder: (context, index) {
              return PCWidget(
                imageURL:
                    '$kNetWortPosterPath${productionCompaniesList[index].logoPath ?? ''}',
                name: productionCompaniesList[index].name ?? '',
              );
            },
          ),
        )
      ],
    );
  }
}

class RecommendedMovieItemView extends StatelessWidget {
  const RecommendedMovieItemView({
    Key? key,
    required this.getSimilarMovieList,
  }) : super(key: key);
  final List<MovieVO>? getSimilarMovieList;
  @override
  Widget build(BuildContext context) {
    return RecommendedMovieView(
      getSimilarMovieList: getSimilarMovieList ?? [],
    );
  }
}

class RecommendedMovieView extends StatelessWidget {
  const RecommendedMovieView({
    Key? key,
    required this.getSimilarMovieList,
  }) : super(key: key);
  final List<MovieVO> getSimilarMovieList;

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
          height: kSP300x,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: getSimilarMovieList.length,
            itemBuilder: (context, index) {
              return MovieNameAndRatingView(
                movieId: getSimilarMovieList[index].id ?? 0,
                heightForColorOpacity: kSP230x,
                imageURL: getSimilarMovieList[index].posterPath ?? "",
                textForRating: getSimilarMovieList[index].voteAverage ?? 0,
                movieName: getSimilarMovieList[index].title ?? "",
                textForVotes: getSimilarMovieList[index].voteCount ?? 0,
                widthForImage: kSP250x,
                height: kSP300x,
                width: kSP200x,
              );
            },
          ),
        )
      ],
    );
  }
}
