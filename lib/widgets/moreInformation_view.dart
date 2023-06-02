import 'package:flutter/material.dart';
import 'package:movie_app_project_test/widgets/easy_text_widget.dart';
import '../constant/dimens.dart';

class MoreInformationView extends StatelessWidget {
  const MoreInformationView(
      {Key? key, required this.about, required this.aboutSpecific})
      : super(key: key);
  final String about;
  final String aboutSpecific;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: kSP40x,
            width: kSP130x,
            child: EasyText(
              text: about,
              fontWeight: FontWeight.w400,
            )),
        Flexible(
            child: EasyText(text: aboutSpecific, fontWeight: FontWeight.w400)),
      ],
    );
  }
}
