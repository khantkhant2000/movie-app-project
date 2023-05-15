import 'package:flutter/cupertino.dart';

import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/moreInformationSpecific_view_widget.dart';
import '../../widgets/textAndMyDivider_widget.dart';
import '../home_page_view_items/home_page_view_items.dart';

class BiographyItemView extends StatelessWidget {
  const BiographyItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: kSP40x, horizontal: kSP10x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextAndMyDividerWidget(titleText: kBiographyText),
          SizedBox(height: kSP10x),
          EasyText(
            text: kBiographyOfRobertDowneyJr,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}

class MoreInformationItemView extends StatelessWidget {
  const MoreInformationItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: kSP10x, bottom: kSP30x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextAndMyDividerWidget(titleText: kMoreInformationText),
          SizedBox(height: kSP10x),
          MoreInformationSpecificViewWidget(
            birthday: kBirthdayOfRobert,
            gender: true,
            placeOfBirth: kPlaceOfBornOfRobert,
            popularity: kPopularOfRobert,
          ),
        ],
      ),
    );
  }
}

class KnownForItemView extends StatelessWidget {
  const KnownForItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: kSP10x),
            child: TitleTextAndMyDividerWidget(titleText: kKnownForText)),
        SizedBox(height: kSP10x),
        PopularMovieItemView(),
      ],
    );
  }
}
