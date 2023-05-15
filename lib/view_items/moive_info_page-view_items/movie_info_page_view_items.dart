import 'package:flutter/material.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../widgets/ListTile_default_widget.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/movie_name_and_rating_widget.dart';
import '../../widgets/production_company_image_widget.dart';

class StarCastItemView extends StatelessWidget {
  const StarCastItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: kSP30x, bottom: kSP10x, left: kSP12x),
          child: EasyText(
            text: kStarCastText,
            fontSize: kFS18x,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                height: kSP80x,
                width: kSP150x,
                child: ListTileDefault(
                  imageURLForActor: kActorAndActressImageURL,
                  actorName: kActorName,
                  actorOrActressOrCrew: "A",
                ),
              ),
              SizedBox(
                height: kSP80x,
                width: kSP150x,
                child: ListTileDefault(
                  imageURLForActor: kActorAndActressImageURL,
                  actorName: kActorName,
                  actorOrActressOrCrew: "A",
                ),
              ),
              SizedBox(
                height: kSP80x,
                width: kSP150x,
                child: ListTileDefault(
                  imageURLForActor: kActorAndActressImageURL,
                  actorName: kActorName,
                  actorOrActressOrCrew: "A",
                ),
              ),
              SizedBox(
                height: kSP80x,
                width: kSP150x,
                child: ListTileDefault(
                  imageURLForActor: kActorAndActressImageURL,
                  actorName: kActorName,
                  actorOrActressOrCrew: "A",
                ),
              ),
              SizedBox(
                height: kSP80x,
                width: kSP150x,
                child: ListTileDefault(
                  imageURLForActor: kActorAndActressImageURL,
                  actorName: kActorName,
                  actorOrActressOrCrew: "A",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TalentSquadItemView extends StatelessWidget {
  const TalentSquadItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: kSP30x, bottom: kSP10x, left: kSP12x),
          child: EasyText(
            text: kTalentSquadText,
            fontSize: kFS18x,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                height: kSP80x,
                width: kSP150x,
                child: ListTileDefault(
                  imageURLForActor: kActorAndActressImageURL,
                  actorName: kActorName,
                  actorOrActressOrCrew: "A",
                ),
              ),
              SizedBox(
                height: kSP80x,
                width: kSP150x,
                child: ListTileDefault(
                  imageURLForActor: kActorAndActressImageURL,
                  actorName: kActorName,
                  actorOrActressOrCrew: "A",
                ),
              ),
              SizedBox(
                height: kSP80x,
                width: kSP150x,
                child: ListTileDefault(
                  imageURLForActor: kActorAndActressImageURL,
                  actorName: kActorName,
                  actorOrActressOrCrew: "A",
                ),
              ),
              SizedBox(
                height: kSP80x,
                width: kSP150x,
                child: ListTileDefault(
                  imageURLForActor: kActorAndActressImageURL,
                  actorName: kActorName,
                  actorOrActressOrCrew: "A",
                ),
              ),
              SizedBox(
                height: kSP80x,
                width: kSP150x,
                child: ListTileDefault(
                  imageURLForActor: kActorAndActressImageURL,
                  actorName: kActorName,
                  actorOrActressOrCrew: "A",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ProductionCompanyItemView extends StatelessWidget {
  const ProductionCompanyItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(kSP12x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: kSP20x, bottom: kSP10x),
            child: EasyText(
              text: kProductionCompanyText,
              fontSize: kFS18x,
            ),
          ),
          Row(
            children: [
              PI_DefaultWidget(),
              PI_DefaultWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class RecommendedMovieItemView extends StatelessWidget {
  const RecommendedMovieItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: kSP20x, left: kSP12x, bottom: kSP10x),
          child: EasyText(
            text: kRecommendedText,
            fontSize: kFS18x,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieNameAndRatingView(
                height: kSP280x,
                imageURL: kIronMan3ImageURL,
                textForRating: kIronMan3Rating,
                textForVotes: kIronMan3Vote,
                movieName: kIronMan3Text,
              ),
              MovieNameAndRatingView(
                height: kSP280x,
                imageURL: kIronMan3ImageURL,
                textForRating: kIronMan3Rating,
                textForVotes: kIronMan3Vote,
                movieName: kIronMan3Text,
              ),
              MovieNameAndRatingView(
                height: kSP280x,
                imageURL: kIronMan3ImageURL,
                textForRating: kIronMan3Rating,
                textForVotes: kIronMan3Vote,
                movieName: kIronMan3Text,
              ),
              MovieNameAndRatingView(
                height: kSP280x,
                imageURL: kIronMan3ImageURL,
                textForRating: kIronMan3Rating,
                textForVotes: kIronMan3Vote,
                movieName: kIronMan3Text,
              ),
              MovieNameAndRatingView(
                height: kSP280x,
                imageURL: kIronMan3ImageURL,
                textForRating: kIronMan3Rating,
                textForVotes: kIronMan3Vote,
                movieName: kIronMan3Text,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StoryLineItemView extends StatelessWidget {
  const StoryLineItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(kSP12x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: kSP20x, bottom: kSP10x),
            child: EasyText(
              text: kStoryLineText,
              fontSize: kFS18x,
            ),
          ),
          EasyText(
            text: kStoryLineViewText,
            fontWeight: FontWeight.w300,
            fontSize: kFS13x,
          )
        ],
      ),
    );
  }
}
