import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';

class EasyText extends StatelessWidget {
  const EasyText(
      {Key? key,
      required this.text,
      this.textColor = kEasyTextColor,
      this.fontSize = kFS14x,
      this.fontWeight = FontWeight.bold})
      : super(key: key);
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
