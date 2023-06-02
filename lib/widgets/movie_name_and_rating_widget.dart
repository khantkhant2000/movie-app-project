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
    this.height = kMovieNameAndRatingDefaultHeight,
    this.width = kMovieNameAndRatingDefaultWidth,
    this.heightForColorOpacity = kSP260x,
    required this.textForRating,
    required this.textForVotes,
    required this.movieName,
    this.widthForImage = 200,
    required this.movieId,
  }) : super(key: key);
  final String imageURL;
  final double textForRating;
  final int textForVotes;
  final String movieName;
  final double height;
  final double heightForColorOpacity;
  final double width;
  final double widthForImage;
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP10x),
      child: SizedBox(
        width: width,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          // Positioned.fill(child: GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => MovieDetailPage(
          //               movieId: movieId,
          //             )));
          //   },
          // )),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(kSP20x)),
            child: SizedBox(
              width: widthForImage,
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
            bottom: kSP10x,
            left: kSP10x,
            child: Icon(
              Icons.star_border_outlined,
              color: kStarIconColor,
            ),
          ),
          Positioned(
              bottom: kSP12x,
              left: kSP45x,
              child: EasyText(
                  text: '$textForRating', textColor: kRatingAndViewTextColor)),
          Positioned(
            bottom: kSP12x,
            right: kSP30x,
            child: EasyText(
                text: " $textForVotes votes",
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
