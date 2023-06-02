import 'package:flutter/material.dart';
import 'package:movie_app_project_test/data/model/movie_model.dart';
import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import 'package:movie_app_project_test/data/vos/crew_vo/crew_vo.dart';
import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../data/vos/cast-_vo/cast_vo.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import '../data/vos/movie_vo/result_vo.dart';
import '../data/vos/production_companies_vo/production_companies_vo.dart';
import '../view_items/moive_info_page-view_items/movie_info_page_view_items.dart';
import '../widgets/back_arrow_icon_widget.dart';
import '../widgets/sliverAppBar_movieImages_widget.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({
    Key? key,
    required this.movieId,
  }) : super(key: key);
  final int movieId;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final MovieModel movieModel = MovieModelImpl();
  MovieDetailResponse? movieDetail;
  List<CastVO>? getCastList;
  List<CrewVO>? getCrewList;
  List<ProductionCompaniesVO>? getProductionCompaniesList;
  List<MovieVO>? getSimilarMovieList;
  List<GenresVO>? genresList;

  @override
  void initState() {
    movieModel.getMovieDetail(widget.movieId).then((value) {
      setState(() {
        movieDetail = value;
      });
    });
    movieModel.getCast(widget.movieId).then((value) {
      setState(() {
        getCastList = value;
      });
    });
    movieModel.getCrew(widget.movieId).then((value) {
      setState(() {
        getCrewList = value;
      });
    });
    movieModel.getProductionCompaniesList(widget.movieId).then((value) {
      setState(() {
        getProductionCompaniesList = value;
      });
    });
    movieModel.getSimilarMovieList(widget.movieId).then((value) {
      setState(() {
        getSimilarMovieList = value;
      });
    });
    movieModel.getGenresListForMovieType(widget.movieId).then((value) {
      setState(() {
        genresList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: MovieDetailItemView(
          getProductionCompaniesList: getProductionCompaniesList,
          getCastList: getCastList,
          getCrewList: getCrewList,
          movieDetail: movieDetail,
          getSimilarMovieList: getSimilarMovieList,
          getGenresList: genresList,
        ));
  }
}

class MovieDetailItemView extends StatelessWidget {
  const MovieDetailItemView(
      {Key? key,
      required this.movieDetail,
      required this.getCastList,
      required this.getCrewList,
      required this.getProductionCompaniesList,
      required this.getSimilarMovieList,
      required this.getGenresList})
      : super(key: key);
  final MovieDetailResponse? movieDetail;
  final List<CastVO>? getCastList;
  final List<CrewVO>? getCrewList;
  final List<ProductionCompaniesVO>? getProductionCompaniesList;
  final List<MovieVO>? getSimilarMovieList;
  final List<GenresVO>? getGenresList;
  @override
  Widget build(BuildContext context) {
    // print("this is genres list items====>$getGenresList");
    // print(
    //     "this is production companies list items====>$getProductionCompaniesList");
    if (movieDetail != null &&
        getCastList != null &&
        getCrewList != null &&
        getSimilarMovieList != null &&
        getGenresList != null) {
      return NestedScrollView(
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
                genresList: getGenresList ?? [],
                movieDetailResponse: movieDetail,
              )),
        ],
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoryLineItemView(movieId: movieDetail?.id ?? 0),
            StarCastItemView(
              castList: getCastList ?? [],
            ),
            TalentSquadItemView(
              getCrewList: getCrewList,
            ),
            ProductionCompanyItemView(
              productionCompaniesList: getProductionCompaniesList ?? [],
            ),
            RecommendedMovieItemView(
              getSimilarMovieList: getSimilarMovieList,
            ),
          ],
        )),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }
}
