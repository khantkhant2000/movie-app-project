import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import 'easy_text_widget.dart';

class TitleTextAndMyDividerWidget extends StatelessWidget {
  const TitleTextAndMyDividerWidget({Key? key, required this.titleText})
      : super(key: key);
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EasyText(
          text: titleText,
          fontWeight: FontWeight.bold,
          fontSize: kFS18x,
        ),
        const Divider(
          color: kMyDividerColor,
          thickness: kTK2x,
        ),
      ],
    );
  }
}
