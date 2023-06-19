import 'package:flutter/material.dart';
import 'package:movie_app_project_test/bloc/home_page_bloc.dart';
import 'package:movie_app_project_test/data/vos/genres_vo/genres_vo.dart';
import 'package:provider/provider.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../data/vos/actor_result_vo/actor_result_vo.dart';
import '../../data/vos/movie_vo/result_vo.dart';
import '../../pages/search_movie_page.dart';
import '../../widgets/carousel_slider_image_for_actor.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/carousel_slider_for_image.dart';
import '../../widgets/is_loading_widget.dart';
import '../../widgets/movie_name_and_rating_widget.dart';

///Search Movies and Icon session
class SearchBarAndSearchIconItemView extends StatelessWidget {
  const SearchBarAndSearchIconItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: kSP60x, left: kSP20x, right: kSP20x, bottom: kSP30x),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SearchMoviePage()));
        },
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
              child: const Icon(Icons.search,
                  color: kSearchIconColor, size: kFS25x),
            )
          ],
        ),
      ),
    );
  }
}

/// Genres (Movie Type) Scroll View session
class MovieTypeScrollItemView extends StatelessWidget {
  const MovieTypeScrollItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<GenresVO>?>(
      selector: (_, bloc) => bloc.genresList,
      builder: (_, bloc, __) {
        return (bloc == null)
            ? const IsLoadingWidget()
            : MovieTypeView(
                onTap: (genres) {
                  final instance = context.read<HomePageBloc>();
                  instance.checkColorGenresMovieType(genres);
                },
                genresList: bloc,
              );
      },
    );
  }
}

class MovieTypeView extends StatelessWidget {
  const MovieTypeView({Key? key, required this.onTap, required this.genresList})
      : super(key: key);
  final List<GenresVO> genresList;
  final Function(GenresVO) onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP45x,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genresList.length,
        padding: const EdgeInsets.symmetric(horizontal: kSP10x),
        itemBuilder: (_, index) {
          return GestureDetector(
              onTap: () {
                onTap(genresList[index]);
              },
              child: Container(
                margin: const EdgeInsets.only(right: kSP10x),
                alignment: Alignment.center,
                width: kSP100x,
                height: kSP45x,
                decoration: BoxDecoration(
                  color: (genresList[index].isSelected)
                      ? kMovieTypeBackgroundColor
                      : kMovieTypeWidgetDefaultBackgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(kSP5x)),
                ),
                child: EasyText(
                  text: genresList[index].name ?? '',
                  fontWeight: FontWeight.w500,
                ),
              ));
        },
      ),
    );
  }
}

/// Carousel Slider View Session
class CarouselSliderImageItemView extends StatelessWidget {
  const CarouselSliderImageItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieVO>?>(
      selector: (_, bloc) => bloc.getNowPlayingMovieList,
      builder: (_, bloc, __) {
        return (bloc == null)
            ? const IsLoadingWidget()
            : CarouselSliderImageView(
                getNowPlayingMovieList: bloc,
              );
      },
    );
  }
}

class CarouselSliderImageView extends StatelessWidget {
  const CarouselSliderImageView({
    Key? key,
    required this.getNowPlayingMovieList,
  }) : super(key: key);
  final List<MovieVO> getNowPlayingMovieList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP400x,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: getNowPlayingMovieList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(bottom: kSP10x),
                child: CarouselSliderImage(
                    imagesURL: getNowPlayingMovieList.take(5).toList(),
                    widget: const CircleAvatar(
                      backgroundColor: kPlayIconBackgroundColor,
                      child: Icon(
                        Icons.play_arrow_outlined,
                      ),
                    )));
          }),
    );
  }
}

/// GetNowPlaying Movies Session
class MovieNameAndRatingItemView extends StatelessWidget {
  const MovieNameAndRatingItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieVO>?>(
        selector: (_, bloc) => bloc.getNowPlayingMovieList,
        builder: (_, bloc, __) => (bloc == null)
            ? const IsLoadingWidget()
            : MovieView(
                movieList: bloc,
              ));
  }
}

class MovieView extends StatelessWidget {
  const MovieView({Key? key, required this.movieList}) : super(key: key);
  final List<MovieVO> movieList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP190x,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return MovieNameAndRatingView(
            movieId: movieList[index].id ?? 0,
            heightForColorOpacity: kSP230x,
            imageURL: movieList[index].posterPath ?? "",
            textForRating: movieList[index].voteAverage ?? 0,
            movieName: movieList[index].title ?? "",
            textForVotes: movieList[index].voteCount ?? 0,
            widthForImage: kSP180x,
            heightForImage: kSP180x,
            widthForBox: kSP170x,
          );
        },
      ),
    );
  }
}

///You May Like Text Session
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

///Get Top Rated Movie Session
class YouMayLikeMovieItemView extends StatelessWidget {
  const YouMayLikeMovieItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieVO>?>(
      selector: (_, bloc) => bloc.getTopRatedMovieList,
      builder: (_, bloc, __) => (bloc == null)
          ? const IsLoadingWidget()
          : YouMayLikeMovieView(
              topRatedMovieList: bloc,
            ),
    );
  }
}

class YouMayLikeMovieView extends StatelessWidget {
  const YouMayLikeMovieView({Key? key, required this.topRatedMovieList})
      : super(key: key);
  final List<MovieVO> topRatedMovieList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP230x,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topRatedMovieList.length,
        itemBuilder: (context, index) {
          return MovieNameAndRatingView(
            movieId: topRatedMovieList[index].id ?? 0,
            heightForColorOpacity: kSP230x,
            imageURL: topRatedMovieList[index].posterPath ?? "",
            textForRating: topRatedMovieList[index].voteAverage ?? 0,
            movieName: topRatedMovieList[index].title ?? "",
            textForVotes: topRatedMovieList[index].voteCount ?? 0,
            heightForImage: kSP220x,
            widthForImage: kSP180x,
          );
        },
      ),
    );
  }
}

///Popular Text Session
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

///Popular Movie Session
class PopularMovieItemView extends StatelessWidget {
  const PopularMovieItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieVO>?>(
      selector: (_, bloc) => bloc.getPopularMoviesList,
      builder: (_, bloc, __) => (bloc == null)
          ? const IsLoadingWidget()
          : PopularMovieView(
              popularMovies: bloc,
            ),
    );
  }
}

class PopularMovieView extends StatelessWidget {
  const PopularMovieView({Key? key, required this.popularMovies})
      : super(key: key);
  final List<MovieVO> popularMovies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP230x,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularMovies.length,
        itemBuilder: (context, index) {
          return MovieNameAndRatingView(
            movieId: popularMovies[index].id ?? 0,
            heightForColorOpacity: kSP230x,
            imageURL: popularMovies[index].posterPath ?? '',
            textForRating: popularMovies[index].voteAverage ?? 0,
            movieName: popularMovies[index].title ?? "",
            textForVotes: popularMovies[index].voteCount ?? 0,
            heightForImage: kSP220x,
            widthForImage: kSP200x,
          );
        },
      ),
    );
  }
}

///Actor and Actress Session
class ActorAndActressItemView extends StatelessWidget {
  const ActorAndActressItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<ActorResultsVO>?>(
      selector: (_, bloc) => bloc.actorsList,
      builder: (_, bloc, __) => (bloc == null)
          ? const IsLoadingWidget()
          : ActorAndActressView(
              actorsResult: bloc,
            ),
    );
  }
}

class ActorAndActressView extends StatelessWidget {
  const ActorAndActressView({Key? key, required this.actorsResult})
      : super(key: key);
  final List<ActorResultsVO> actorsResult;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kSP420x,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: actorsResult.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: kSP30x),
                child: CarouselSliderForActor(
                  id: actorsResult[index].id ?? 0,
                  imagesURL: actorsResult,
                ),
              );
            }));
  }
}
