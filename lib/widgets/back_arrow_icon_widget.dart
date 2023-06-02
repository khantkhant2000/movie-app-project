import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';

class BackArrowIconWidget extends StatelessWidget {
  const BackArrowIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Padding(
        padding: EdgeInsets.only(left: kSP15x),
        child: CircleAvatar(
          backgroundColor: kPlayIconBackgroundColor,
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      Positioned.fill(child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
      ))
    ]);
  }
}
