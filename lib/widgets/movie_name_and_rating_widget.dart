import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_project_test/widgets/easy_text_widget.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../pages/movie_info_page.dart';

class MovieNameAndRatingView extends StatelessWidget {
  const MovieNameAndRatingView({
    Key? key,
    required this.imageURL,
    required this.textForRating,
    required this.textForVotes,
    required this.movieName,
    this.height = kMovieNameAndRatingDefaultHeight,
    this.width = kMovieNameAndRatingDefaultWidth,
    this.heightForColorOpacity = kSP260x,
  }) : super(key: key);
  final String imageURL;
  final String movieName;
  final String textForRating;
  final String textForVotes;
  final double height;
  final double heightForColorOpacity;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP10x),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
              height: height,
              width: width,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(kSP20x)),
                child: CachedNetworkImage(
                  imageUrl: imageURL,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Image.asset(
                    kPlaceHolderImage,
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              )),
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
                horizontal: kSP10x, vertical: kSP45x),
            child: Text(
              movieName,
              style: const TextStyle(
                fontSize: kFS15x,
                color: kMovieNameTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: kSP10x, bottom: kSP5x, right: kSP5x),
                child: Icon(
                  Icons.star_border_outlined,
                  color: kStarIconColor,
                ),
              ),
              const SizedBox(width: kSP5x),
              EasyText(text: textForRating, textColor: kRatingAndViewTextColor),
              const SizedBox(width: kSP30x),
              EasyText(
                  text: " $textForVotes votes",
                  textColor: kRatingAndViewTextColor)
            ],
          ),
          Positioned.fill(child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MovieInfoPage()));
            },
          )),
        ],
      ),
    );
  }
}
