import 'package:flutter/material.dart';

import '../constant/strings.dart';
import 'moreInformation_view.dart';

class MoreInformationSpecificViewWidget extends StatelessWidget {
  const MoreInformationSpecificViewWidget(
      {Key? key,
      required this.placeOfBirth,
      required this.birthday,
      this.deadDay = "-",
      required this.gender,
      required this.popularity})
      : super(key: key);
  final String placeOfBirth;
  final String birthday;
  final String deadDay;
  final bool gender;
  final double popularity;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MoreInformationView(about: kPlaceOfBirth, aboutSpecific: placeOfBirth),
        MoreInformationView(about: kBirthday, aboutSpecific: birthday),
        MoreInformationView(about: kDeadDay, aboutSpecific: deadDay),
        MoreInformationView(
            about: kGender,
            aboutSpecific: (gender == true) ? "Male" : "Female"),
        MoreInformationView(about: kPopularity, aboutSpecific: "$popularity"),
      ],
    );
  }
}
