// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movie_app_project_test/constant/dimens.dart';

import '../constant/colors.dart';
import '../constant/strings.dart';
import 'easy_text_widget.dart';

class PI_DefaultWidget extends StatelessWidget {
  const PI_DefaultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(kSP5x),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(kSP30x), right: Radius.circular(kSP30x)),
            child: Image(
              width: kSP90x,
              height: kSP70x,
              image: AssetImage(kPlaceHolderImage),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: kSP10x),
          EasyText(
            text: kMarvelStudioText,
            fontSize: kFS12x,
            fontWeight: FontWeight.w400,
            textColor: kMarvelStudioTextColor,
          ),
        ],
      ),
    );
  }
}
