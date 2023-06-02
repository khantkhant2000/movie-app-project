import 'package:flutter/material.dart';
import 'package:movie_app_project_test/data/model/movie_model.dart';
import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import 'package:movie_app_project_test/data/vos/genres_vo/genres_vo.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../data/vos/actor_result_vo/actor_result_vo.dart';
import '../../data/vos/movie_vo/result_vo.dart';
import '../../widgets/carousel_slider_image_for_actor.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/carousel_slider_for_image.dart';
import '../../widgets/movie_name_and_rating_widget.dart';
import '../../widgets/movie_type_widget.dart';

MovieModel _movieModel = MovieModelImpl();

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

class MovieTypeScrollItemView extends StatefulWidget {
  const MovieTypeScrollItemView({
    Key? key,
    this.genresList,
  }) : super(key: key);
  final List<GenresVO>? genresList;
  @override
  State<MovieTypeScrollItemView> createState() =>
      _MovieTypeScrollItemViewState();
}

class _MovieTypeScrollItemViewState extends State<MovieTypeScrollItemView> {
  MovieModel movieModel = MovieModelImpl();
  List<GenresVO> list = [];

  @override
  void initState() {
    movieModel.getGenresList().then((value) {
      setState(() {
        list = value ?? [];
        final firstData = list.first;
        firstData.isSelected = true;
        list.removeAt(0);
        list.insert(0, firstData);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MovieTypeView(
      genresList: list,
      onTap: (genres) {
        setState(() {
          list = list.map((e) {
            if (e == genres) {
              e.isSelected = true;
            } else {
              e.isSelected = false;
            }

            return e;
          }).toList();
        });
      },
    );
  }
}

class MovieTypeView extends StatelessWidget {
  const MovieTypeView({Key? key, required this.genresList, required this.onTap})
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
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onTap(genresList[index]);
            },
            child: MovieTypeWidget(
              movieType: genresList[index].name ?? "",
              color: (genresList[index].isSelected)
                  ? kMovieTypeBackgroundColor
                  : kMovieTypeWidgetDefaultBackgroundColor,
            ),
          );
        },
      ),
    );
  }
}

class CarouselSliderImageItemView extends StatelessWidget {
  const CarouselSliderImageItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieVO>?>(
        future: _movieModel.getMovieList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            debugPrint("Error Fetching");
          }
          final moviePosterPath = snapshot.data;
          return CarouselSliderImageView(movies: moviePosterPath);
        });
  }
}

class CarouselSliderImageView extends StatelessWidget {
  const CarouselSliderImageView({
    Key? key,
    required this.movies,
  }) : super(key: key);
  final List<MovieVO>? movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP400x,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies?.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(bottom: kSP10x),
                child: CarouselSliderImage(
                    imagesURL: movies?.take(5).toList(),
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

class MovieNameAndRatingItemView extends StatelessWidget {
  const MovieNameAndRatingItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieVO>?>(
      future: _movieModel.getMovieList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          debugPrint("error fetching");
        }
        final movieList = snapshot.data;
        return MovieView(
          movieList: movieList,
        );
      },
    );
  }
}

class MovieView extends StatelessWidget {
  const MovieView({Key? key, required this.movieList}) : super(key: key);
  final List<MovieVO>? movieList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP250x,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieList?.length,
        itemBuilder: (context, index) {
          return MovieNameAndRatingView(
            movieId: movieList?[index].id ?? 0,
            heightForColorOpacity: kSP230x,
            imageURL: movieList?[index].posterPath ?? "",
            textForRating: movieList?[index].voteAverage ?? 0,
            movieName: movieList?[index].title ?? "",
            textForVotes: movieList?[index].voteCount ?? 0,
          );
        },
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
    return FutureBuilder<List<MovieVO>?>(
      future: _movieModel.getMovieList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          debugPrint("Error Fetching");
        }
        final movieList = snapshot.data;
        return YouMayLikeMovieView(
          topRatedMovies: movieList,
        );
      },
    );
  }
}

class YouMayLikeMovieView extends StatelessWidget {
  const YouMayLikeMovieView({Key? key, required this.topRatedMovies})
      : super(key: key);
  final List<MovieVO>? topRatedMovies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP300x,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topRatedMovies?.length,
        itemBuilder: (context, index) {
          return MovieNameAndRatingView(
            movieId: topRatedMovies?[index].id ?? 0,
            heightForColorOpacity: kSP230x,
            imageURL: topRatedMovies?[index].posterPath ?? "",
            textForRating: topRatedMovies?[index].voteAverage ?? 0,
            movieName: topRatedMovies?[index].title ?? "",
            textForVotes: topRatedMovies?[index].voteCount ?? 0,
            widthForImage: kSP250x,
            height: kSP300x,
            width: kSP200x,
          );
        },
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
    return FutureBuilder<List<MovieVO>?>(
      future: _movieModel.getMovieList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          debugPrint("Error Fetching");
        }
        final popularMovieList = snapshot.data;
        return PopularMovieView(popularMovies: popularMovieList);
      },
    );
  }
}

class PopularMovieView extends StatelessWidget {
  const PopularMovieView({Key? key, required this.popularMovies})
      : super(key: key);
  final List<MovieVO>? popularMovies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP300x,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularMovies?.length,
        itemBuilder: (context, index) {
          return MovieNameAndRatingView(
            movieId: popularMovies?[index].id ?? 0,
            heightForColorOpacity: kSP230x,
            imageURL: popularMovies?[index].posterPath ?? '',
            textForRating: popularMovies?[index].voteAverage ?? 0,
            movieName: popularMovies?[index].title ?? "",
            textForVotes: popularMovies?[index].voteCount ?? 0,
            widthForImage: kSP250x,
            height: kSP300x,
            width: kSP200x,
          );
        },
      ),
    );
  }
}

class ActorAndActressItemView extends StatelessWidget {
  const ActorAndActressItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ActorResultsVO>?>(
      future: _movieModel.getActorsList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          debugPrint("Error Fetching");
        }
        final actorResult = snapshot.data;
        return ActorAndActressView(actorsResult: actorResult);
      },
    );
  }
}

class ActorAndActressView extends StatelessWidget {
  const ActorAndActressView({Key? key, required this.actorsResult})
      : super(key: key);
  final List<ActorResultsVO>? actorsResult;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kSP420x,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: actorsResult?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: kSP30x),
                child: CarouselSliderForActor(
                  id: actorsResult?[index].id ?? 0,
                  imagesURL: actorsResult,
                ),
              );
            }));
  }
}
