import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_project_test/constant/api_constant.dart';
import 'package:movie_app_project_test/widgets/easy_text_widget.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../pages/movie_info_page.dart';

class MovieNameAndRatingView extends StatelessWidget {
  const MovieNameAndRatingView({
    Key? key,
    required this.imageURL,
    this.heightForImage = kMovieNameAndRatingDefaultHeight,
    this.widthForImage = kMovieNameAndRatingDefaultWidth,
    this.heightForColorOpacity = kSP260x,
    required this.textForRating,
    required this.textForVotes,
    required this.movieName,
    required this.movieId,
    this.widthForBox = kSP180x,
  }) : super(key: key);
  final String imageURL;
  final double textForRating;
  final int textForVotes;
  final String movieName;
  final double heightForImage;
  final double widthForImage;
  final double heightForColorOpacity;
  final double widthForBox;

  final int movieId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP10x),
      child: SizedBox(
        width: widthForBox,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          SizedBox(
            height: heightForImage,
            width: widthForImage,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(kSP20x)),
              child: CachedNetworkImage(
                imageUrl: kNetWortPosterPath + imageURL,
                fit: BoxFit.cover,
                placeholder: (context, url) => Image.asset(
                  kPlaceHolderImage,
                  fit: BoxFit.cover,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            left: kSP0x,
            bottom: kSP0x,
            right: kSP0x,
            height: heightForColorOpacity,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(kCO_09x),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kSP15x, vertical: kSP45x),
            child: Text(
              movieName,
              style: const TextStyle(
                fontSize: kFS15x,
                color: kMovieNameTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            bottom: kSP15x,
            left: kSP10x,
            child: Icon(
              size: kSP19x,
              Icons.star_border_outlined,
              color: kStarIconColor,
            ),
          ),
          Positioned(
              bottom: kSP17x,
              left: kSP40x,
              child: EasyText(
                text: '$textForRating',
                textColor: kRatingAndViewTextColor,
                fontSize: kFS13x,
              )),
          Positioned(
            bottom: kSP17x,
            left: kSP80x,
            child: EasyText(
                text: " $textForVotes votes",
                fontSize: kFS13x,
                textColor: kRatingAndViewTextColor),
          ),
          Positioned.fill(child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MovieDetailPage(
                        movieId: movieId,
                      )));
            },
          )),
        ]),
      ),
    );
  }
}
