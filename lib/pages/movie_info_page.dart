import 'package:flutter/material.dart';
import 'package:movie_app_project_test/data/model/movie_model.dart';
import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import 'package:movie_app_project_test/data/vos/crew_vo/crew_vo.dart';
import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';
import '../data/vos/cast-_vo/cast_vo.dart';
import '../data/vos/movie_vo/result_vo.dart';
import '../view_items/moive_info_page-view_items/movie_info_page_view_items.dart';

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
  List<CastVO> getCastList = [];
  List<CrewVO> getCrewList = [];
  List<MovieVO> getSimilarMovieList = [];

  @override
  void initState() {
    movieModel.getMovieDetail(widget.movieId);
    movieModel.getMovieDetailFromDataBase(widget.movieId).listen((event) {
      if (mounted) {
        setState(() {
          movieDetail = event;
        });
      }
    });

    movieModel.getSimilarMovieList(widget.movieId);
    movieModel.getSimilarMovieListFormDataBase().listen((event) {
      if (mounted) {
        setState(() {
          getSimilarMovieList = event ?? [];
        });
      }
    });
    movieModel.getCastList(widget.movieId);
    movieModel.getCastFromDataBase().listen((event) {
      if (mounted) {
        setState(() {
          getCastList = event ?? [];
        });
      }
    });

    movieModel.getCrewList(widget.movieId);
    movieModel.getCrewFromDataBase().listen((event) {
      if (mounted) {
        setState(() {
          getCrewList = event ?? [];
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: MovieDetailItemView(
          getCastList: getCastList,
          getCrewList: getCrewList,
          movieDetail: movieDetail,
          getSimilarMovieList: getSimilarMovieList,
        ));
  }
}
