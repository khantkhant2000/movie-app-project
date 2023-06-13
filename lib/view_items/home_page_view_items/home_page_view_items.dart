import 'package:flutter/material.dart';
import 'package:movie_app_project_test/data/model/movie_model.dart';
import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import 'package:movie_app_project_test/data/vos/genres_vo/genres_vo.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../data/vos/actor_result_vo/actor_result_vo.dart';
import '../../data/vos/movie_vo/result_vo.dart';
import '../../pages/search_movie_page.dart';
import '../../widgets/carousel_slider_image_for_actor.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/carousel_slider_for_image.dart';
import '../../widgets/movie_name_and_rating_widget.dart';
import '../../widgets/movie_type_widget.dart';

MovieModel _movieModel = MovieModelImpl();

class HomePageViewItems extends StatelessWidget {
  const HomePageViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarAndSearchIconItemView(),
          MovieTypeScrollItemView(),
          CarouselSliderImageItemView(),
          MovieNameAndRatingItemView(),
          YouMayLikeTextView(),
          YouMayLikeMovieItemView(),
          PopularTextView(),
          PopularMovieItemView(),
          ActorAndActressItemView(),
        ],
      ),
    );
  }
}

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

/// Genres Movie Type Scroll View session
class MovieTypeScrollItemView extends StatefulWidget {
  const MovieTypeScrollItemView({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieTypeScrollItemView> createState() =>
      _MovieTypeScrollItemViewState();
}

class _MovieTypeScrollItemViewState extends State<MovieTypeScrollItemView> {
  List<GenresVO> list = [];

  @override
  void initState() {
    _movieModel.getGenresList();
    _movieModel.getGenresListFromDataBase().listen((event) {
      if (mounted) {
        setState(() {
          list = event ?? [];
          final firstData = list.first;
          firstData.isSelected = true;
          list.removeAt(0);
          list.insert(0, firstData);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : MovieTypeView(
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

/// Carousel Slider View Session
class CarouselSliderImageItemView extends StatefulWidget {
  const CarouselSliderImageItemView({Key? key}) : super(key: key);

  @override
  State<CarouselSliderImageItemView> createState() =>
      _CarouselSliderImageItemViewState();
}

class _CarouselSliderImageItemViewState
    extends State<CarouselSliderImageItemView> {
  List<MovieVO> getNowPlayingMovieList = [];
  @override
  void initState() {
    _movieModel.getNowPlayingMovieList();
    _movieModel.getNowPlayingMovieListFormDataBase().listen((event) {
      if (mounted) {
        setState(() {
          getNowPlayingMovieList = event ?? [];
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getNowPlayingMovieList.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : CarouselSliderImageView(
            getNowPlayingMovieList: getNowPlayingMovieList,
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
class MovieNameAndRatingItemView extends StatefulWidget {
  const MovieNameAndRatingItemView({Key? key}) : super(key: key);

  @override
  State<MovieNameAndRatingItemView> createState() =>
      _MovieNameAndRatingItemViewState();
}

class _MovieNameAndRatingItemViewState
    extends State<MovieNameAndRatingItemView> {
  List<MovieVO> getNowPlayingMovieList = [];
  @override
  void initState() {
    _movieModel.getNowPlayingMovieList();
    _movieModel.getNowPlayingMovieListFormDataBase().listen((event) {
      if (mounted) {
        setState(() {
          getNowPlayingMovieList = event ?? [];
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getNowPlayingMovieList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : MovieView(
            movieList: getNowPlayingMovieList,
          );
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
class YouMayLikeMovieItemView extends StatefulWidget {
  const YouMayLikeMovieItemView({
    Key? key,
  }) : super(key: key);

  @override
  State<YouMayLikeMovieItemView> createState() =>
      _YouMayLikeMovieItemViewState();
}

class _YouMayLikeMovieItemViewState extends State<YouMayLikeMovieItemView> {
  List<MovieVO> getTopRatedMovieList = [];
  @override
  void initState() {
    _movieModel.getTopRateMovieList();
    _movieModel.getTopRatedMovieListFormDataBase().listen((event) {
      if (mounted) {
        setState(() {
          getTopRatedMovieList = event ?? [];
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getTopRatedMovieList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : YouMayLikeMovieView(
            topRatedMovieList: getTopRatedMovieList,
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
class PopularMovieItemView extends StatefulWidget {
  const PopularMovieItemView({Key? key}) : super(key: key);

  @override
  State<PopularMovieItemView> createState() => _PopularMovieItemViewState();
}

class _PopularMovieItemViewState extends State<PopularMovieItemView> {
  List<MovieVO> getPopularMoviesList = [];
  @override
  void initState() {
    _movieModel.getPopularMovieList();
    _movieModel.getPopularMovieListFormDataBase().listen((event) {
      if (mounted) {
        setState(() {
          getPopularMoviesList = event ?? [];
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopularMovieView(popularMovies: getPopularMoviesList);
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
class ActorAndActressItemView extends StatefulWidget {
  const ActorAndActressItemView({Key? key}) : super(key: key);

  @override
  State<ActorAndActressItemView> createState() =>
      _ActorAndActressItemViewState();
}

class _ActorAndActressItemViewState extends State<ActorAndActressItemView> {
  List<ActorResultsVO> actorsList = [];

  @override
  void initState() {
    _movieModel.getActorsList();
    _movieModel.getActorResultListFormDataBase().listen((event) {
      if (mounted) {
        setState(() {
          actorsList = event ?? [];
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return actorsList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ActorAndActressView(actorsResult: actorsList);
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
