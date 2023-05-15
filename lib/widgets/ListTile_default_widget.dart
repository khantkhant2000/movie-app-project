import 'package:flutter/material.dart';
import 'package:movie_app_project_test/widgets/easy_text_widget.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';

class ListTileDefault extends StatelessWidget {
  const ListTileDefault(
      {Key? key,
      required this.imageURLForActor,
      required this.actorName,
      required this.actorOrActressOrCrew})
      : super(key: key);
  final String imageURLForActor;
  final String actorName;
  final String actorOrActressOrCrew;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: ClipRRect(
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(kSP20x), bottom: Radius.circular(kSP20x)),
          child: Image.network(imageURLForActor),
        ),
        title: EasyText(
          text: (actorOrActressOrCrew == 'A')
              ? "Actor"
              : (actorOrActressOrCrew == "B")
                  ? "Actress"
                  : "Crew",
          fontSize: kSP14x,
          fontWeight: FontWeight.w600,
        ),
        subtitle: EasyText(
          text: actorName,
          fontSize: kSP12x,
          textColor: kListTileTextColor,
        ));
  }
}
