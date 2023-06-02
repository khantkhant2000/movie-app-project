import 'package:flutter/material.dart';
import 'package:movie_app_project_test/widgets/easy_text_widget.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';

class MovieTypeWidget extends StatelessWidget {
  const MovieTypeWidget(
      {Key? key,
      required this.movieType,
      this.color = kMovieTypeWidgetDefaultBackgroundColor})
      : super(key: key);
  final String movieType;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: kSP10x),
      alignment: Alignment.center,
      width: kSP100x,
      height: kSP45x,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(kSP5x)),
      ),
      child: EasyText(
        text: movieType,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
