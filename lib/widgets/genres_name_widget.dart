import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import 'easy_text_widget.dart';

class GenresMovieNameWidget extends StatelessWidget {
  const GenresMovieNameWidget({Key? key, required this.genresList})
      : super(key: key);
  final List<GenresVO> genresList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genresList.length,
        itemBuilder: (context, index) {
          return EasyText(
              text: "${genresList[index].name} |",
              fontSize: 12,
              textColor: kMovieTypeGenresColor);
        },
      ),
    );
  }
}
