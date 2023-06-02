import 'package:flutter/material.dart';
import 'package:movie_app_project_test/data/model/movie_model.dart';
import 'package:movie_app_project_test/data/model/movie_model_impl.dart';
import 'package:movie_app_project_test/pages/home_page.dart';
import 'package:movie_app_project_test/testing.dart';

void main() {
  // MovieModel movieModel = MovieModelImpl();
  // movieModel.getGenresListForMovieType(1020896).then((value) {
  //   print("this is genres value====>$value");
  // });
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
