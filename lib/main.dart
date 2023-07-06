import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_project_test/constant/hive_constant.dart';
import 'package:movie_app_project_test/data/vos/actor_result_vo/actor_result_vo.dart';
import 'package:movie_app_project_test/data/vos/cast-_vo/hive_cast_vo.dart';
import 'package:movie_app_project_test/data/vos/crew_vo/hive_crew_vo.dart';
import 'package:movie_app_project_test/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_app_project_test/data/vos/known_for_vo/hive_known_for_vo.dart';
import 'package:movie_app_project_test/data/vos/known_for_vo/known_for_vo.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/hive_movie_by_genres_id.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/hive_similar_movie.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
import 'package:movie_app_project_test/data/vos/production_companies_vo/production_companies_vo.dart';
import 'package:movie_app_project_test/data/vos/production_countries_vo/production_countries_vo.dart';
import 'package:movie_app_project_test/data/vos/search_movie_vo/search_movie_vo.dart';
import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';
import 'package:movie_app_project_test/pages/home_page.dart';
import 'data/vos/cast-_vo/cast_vo.dart';
import 'data/vos/crew_vo/crew_vo.dart';
import 'data/vos/spoken_languages_vo/spoken_languages_vo.dart';
import 'network/response/actor_detail_response/actor_detail_response.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(GenresVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(ActorResultsVOAdapter());
  Hive.registerAdapter(KnownForVOAdapter());
  Hive.registerAdapter(MovieDetailResponseAdapter());
  Hive.registerAdapter(ProductionCompaniesVOAdapter());
  Hive.registerAdapter(ProductionCountriesVOAdapter());
  Hive.registerAdapter(SpokenLanguagesVOAdapter());
  Hive.registerAdapter(HiveCastVOAdapter());
  Hive.registerAdapter(HiveCrewVOAdapter());
  Hive.registerAdapter(CastVOAdapter());
  Hive.registerAdapter(CrewVOAdapter());
  Hive.registerAdapter(HiveSimilarMovieVOAdapter());
  Hive.registerAdapter(ActorDetailResponseAdapter());
  Hive.registerAdapter(SearchMovieResultVOAdapter());
  Hive.registerAdapter(HiveKnownForVOAdapter());
  Hive.registerAdapter(HiveMovieByGenresIDAdapter());

  await Hive.openBox<GenresVO>(kBoxNameForGenres);
  await Hive.openBox<MovieVO>(kBoxNameForMovies);
  await Hive.openBox<ActorResultsVO>(kBoxNameForActorResult);
  await Hive.openBox<MovieDetailResponse>(kBoxNameForMovieDetail);
  await Hive.openBox<HiveCastVO>(kBoxNameForCast);
  await Hive.openBox<HiveCrewVO>(kBoxNameForCrew);
  await Hive.openBox<HiveSimilarMovieVO>(kBoxNameForHiveSimilarMovieVO);
  await Hive.openBox<ActorDetailResponse>(kBoxNameForActorDetail);
  await Hive.openBox<SearchMovieResultVO>(kBoxNameForSearchMovie);
  await Hive.openBox<HiveKnownForVO>(kBoxNameForHiveKnownForMovieVO);
  await Hive.openBox<HiveMovieByGenresIDVO>(kBoxNameForHiveGetMovieByGenresID);

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
