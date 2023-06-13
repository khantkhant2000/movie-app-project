import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_project_test/constant/hive_constant.dart';
import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import 'package:movie_app_project_test/data/vos/actor_result_vo/actor_result_vo.dart';
import 'package:movie_app_project_test/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_app_project_test/data/vos/known_for_vo/known_for_vo.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
import 'package:movie_app_project_test/data/vos/production_companies_vo/production_companies_vo.dart';
import 'package:movie_app_project_test/data/vos/production_countries_vo/production_countries_vo.dart';
import 'package:movie_app_project_test/data/vos/search_movie_vo/search_movie_vo.dart';
import 'package:movie_app_project_test/data/vos/spocken_languages_vo/spoken_languages_vo.dart';
import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';
import 'package:movie_app_project_test/pages/home_page.dart';
import 'data/model/movie_model.dart';
import 'data/vos/cast-_vo/cast_vo.dart';
import 'data/vos/crew_vo/crew_vo.dart';
import 'network/response/actor_detail_response/actor_detail_response.dart';

void main() async {
  MovieModel _movieModel = MovieModelImpl();
  _movieModel.getSearchMovie("Fast X").then((value) {
    print("this is search movieList=========> $value");
  }).catchError((onError) {
    debugPrint("Error========>$onError");
  });
  await Hive.initFlutter();

  Hive.registerAdapter(GenresVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(ActorResultsVOAdapter());
  Hive.registerAdapter(KnownForVOAdapter());
  Hive.registerAdapter(MovieDetailResponseAdapter());
  Hive.registerAdapter(ProductionCompaniesVOAdapter());
  Hive.registerAdapter(ProductionCountriesVOAdapter());
  Hive.registerAdapter(SpokenLanguagesVOAdapter());
  Hive.registerAdapter(CastVOAdapter());
  Hive.registerAdapter(CrewVOAdapter());
  Hive.registerAdapter(ActorDetailResponseAdapter());
  Hive.registerAdapter(SearchMovieResultVOAdapter());

  await Hive.openBox<GenresVO>(kBoxNameForGenres);
  await Hive.openBox<MovieVO>(kBoxNameForMovies);
  await Hive.openBox<ActorResultsVO>(kBoxNameForActorResult);
  await Hive.openBox<MovieDetailResponse>(kBoxNameForMovieDetail);
  await Hive.openBox<CastVO>(kBoxNameForCast);
  await Hive.openBox<CrewVO>(kBoxNameForCrew);
  await Hive.openBox<ActorDetailResponse>(kBoxNameForActorDetail);
  await Hive.openBox<SearchMovieResultVO>(kBoxNameForSearchMovie);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
