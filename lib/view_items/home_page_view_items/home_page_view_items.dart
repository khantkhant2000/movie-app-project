import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../pages/actor_and_actress_info_page.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/image_carousal_slider_widget.dart';
import '../../widgets/movie_name_and_rating_widget.dart';
import '../../widgets/movie_type_widget.dart';

class SearchBarAndSearchIconItemView extends StatelessWidget {
  const SearchBarAndSearchIconItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: kSP60x, left: kSP20x, right: kSP20x, bottom: kSP30x),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: kSearchBarHeight,
            width: kSearchBarWidth,
            padding: const EdgeInsets.only(left: kSP20x),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              color: kSearchBarBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(kSP20x)),
            ),
            child: const EasyText(
              text: kSearchMovies,
              fontSize: kSP15x,
              textColor: kSearchMovieColor,
            ),
          ),
          Container(
            height: kSearchIconHeight,
            width: kSearchIconWidth,
            decoration: const BoxDecoration(
                color: kSearchIconBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(kSP10x))),
            child:
                const Icon(Icons.search, color: kSearchIconColor, size: kFS25x),
          )
        ],
      ),
    );
  }
}

class MovieTypeScrollItemView extends StatelessWidget {
  const MovieTypeScrollItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: kSP10x, bottom: kSP20x),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieTypeWidget(
              movieType: 'Action ',
              color: Color(0xFFFF0202),
            ),
            MovieTypeWidget(
              movieType: 'Fantastic',
            ),
            MovieTypeWidget(
              movieType: 'Cartoons',
            ),
            MovieTypeWidget(
              movieType: 'Anime',
            ),
            MovieTypeWidget(
              movieType: 'Marvel',
            ),
            MovieTypeWidget(
              movieType: 'DC',
            ),
            MovieTypeWidget(
              movieType: 'Romance',
            ),
            MovieTypeWidget(
              movieType: 'Horror',
            ),
          ],
        ),
      ),
    );
  }
}

List<String> imagesURL = [
  "https://m.media-amazon.com/images/I/71lVAGaqBtL.jpg",
  "https://m.media-amazon.com/images/M/MV5BMjE5MzcyNjk1M15BMl5BanBnXkFtZTcwMjQ4MjcxOQ@@._V1_.jpg",
  "https://www.posterhub.com.sg/images/detailed/115/iron_man_two_ver6_s1jd-g3.jpg",
  "https://m.media-amazon.com/images/I/71niXI3lxlL._AC_UF894,1000_QL80_.jpg",
];

class CarouselSliderImageItemView extends StatelessWidget {
  const CarouselSliderImageItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: kSP10x),
        child: CarouselSliderImage(
            imagesURL: imagesURL,
            widget: const CircleAvatar(
              backgroundColor: kPlayIconBackgroundColor,
              child: Icon(
                Icons.play_arrow_outlined,
              ),
            )));
  }
}

class MovieNameAndRatingItemView extends StatelessWidget {
  const MovieNameAndRatingItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MovieNameAndRatingView(
            heightForColorOpacity: kSP230x,
            imageURL: kIronMan3ImageURL,
            textForRating: kIronMan3Rating,
            textForVotes: kIronMan3Vote,
            movieName: kIronMan3Text,
          ),
          MovieNameAndRatingView(
            heightForColorOpacity: kSP230x,
            imageURL: kIronMan3ImageURL,
            textForRating: kIronMan3Rating,
            textForVotes: kIronMan3Vote,
            movieName: kIronMan3Text,
          ),
          MovieNameAndRatingView(
            heightForColorOpacity: kSP230x,
            imageURL: kIronMan3ImageURL,
            textForRating: kIronMan3Rating,
            textForVotes: kIronMan3Vote,
            movieName: kIronMan3Text,
          ),
          MovieNameAndRatingView(
            heightForColorOpacity: kSP230x,
            imageURL: kIronMan3ImageURL,
            textForRating: kIronMan3Rating,
            textForVotes: kIronMan3Vote,
            movieName: kIronMan3Text,
          ),
          MovieNameAndRatingView(
            heightForColorOpacity: kSP230x,
            imageURL: kIronMan3ImageURL,
            textForRating: kIronMan3Rating,
            textForVotes: kIronMan3Vote,
            movieName: kIronMan3Text,
          ),
        ],
      ),
    );
  }
}

class YouMayLikeTextView extends StatelessWidget {
  const YouMayLikeTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: kSP30x, left: kSP10x, bottom: kSP15x),
      child: EasyText(text: kYouMayLikeText, fontSize: kFS18x),
    );
  }
}

class YouMayLikeMovieItemView extends StatelessWidget {
  const YouMayLikeMovieItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MovieNameAndRatingView(
            movieName: kIronMan3Text,
            textForVotes: kIronMan3Vote,
            textForRating: kIronMan3Rating,
            imageURL: kIronMan3ImageURL,
            height: kSP280x,
            width: kSP180x,
          ),
          MovieNameAndRatingView(
            movieName: kIronMan3Text,
            textForVotes: kIronMan3Vote,
            textForRating: kIronMan3Rating,
            imageURL: kIronMan3ImageURL,
            height: kSP280x,
            width: kSP180x,
          ),
          MovieNameAndRatingView(
            movieName: kIronMan3Text,
            textForVotes: kIronMan3Vote,
            textForRating: kIronMan3Rating,
            imageURL: kIronMan3ImageURL,
            height: kSP280x,
            width: kSP180x,
          ),
          MovieNameAndRatingView(
            movieName: kIronMan3Text,
            textForVotes: kIronMan3Vote,
            textForRating: kIronMan3Rating,
            imageURL: kIronMan3ImageURL,
            height: kSP280x,
            width: kSP180x,
          ),
          MovieNameAndRatingView(
            movieName: kIronMan3Text,
            textForVotes: kIronMan3Vote,
            textForRating: kIronMan3Rating,
            imageURL: kIronMan3ImageURL,
            height: kSP280x,
            width: kSP180x,
          ),
        ],
      ),
    );
  }
}

class PopularTextView extends StatelessWidget {
  const PopularTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: kSP30x, left: kSP10x, bottom: kSP15x),
      child: EasyText(text: kPopularText, fontSize: kFS18x),
    );
  }
}

class PopularMovieItemView extends StatelessWidget {
  const PopularMovieItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MovieNameAndRatingView(
            movieName: kIronMan3Text,
            textForVotes: kIronMan3Vote,
            textForRating: kIronMan3Rating,
            imageURL: kIronMan3ImageURL,
            height: kSP280x,
            width: kSP180x,
          ),
          MovieNameAndRatingView(
            movieName: kIronMan3Text,
            textForVotes: kIronMan3Vote,
            textForRating: kIronMan3Rating,
            imageURL: kIronMan3ImageURL,
            height: kSP280x,
            width: kSP180x,
          ),
          MovieNameAndRatingView(
            movieName: kIronMan3Text,
            textForVotes: kIronMan3Vote,
            textForRating: kIronMan3Rating,
            imageURL: kIronMan3ImageURL,
            height: kSP280x,
            width: kSP180x,
          ),
          MovieNameAndRatingView(
            movieName: kIronMan3Text,
            textForVotes: kIronMan3Vote,
            textForRating: kIronMan3Rating,
            imageURL: kIronMan3ImageURL,
            height: kSP280x,
            width: kSP180x,
          ),
          MovieNameAndRatingView(
            movieName: kIronMan3Text,
            textForVotes: kIronMan3Vote,
            textForRating: kIronMan3Rating,
            imageURL: kIronMan3ImageURL,
            height: kSP280x,
            width: kSP180x,
          ),
        ],
      ),
    );
  }
}

List<String> actorAndActressImagesURL = [
  kActorAndActressImageURL,
  kActorAndActressImageURL,
  kActorAndActressImageURL,
  kActorAndActressImageURL,
  kActorAndActressImageURL,
];

class ActorAndActressItemView extends StatelessWidget {
  const ActorAndActressItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kSP30x),
      child: Stack(
        children: [
          CarouselSliderImage(
            imagesURL: actorAndActressImagesURL,
            widget: const Padding(
              padding: EdgeInsets.only(top: kSP280x),
              child: EasyText(text: kActorName),
            ),
          ),
          Positioned.fill(child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ActorAndActressInfoPage()));
            },
          )),
        ],
      ),
    );
  }
}
