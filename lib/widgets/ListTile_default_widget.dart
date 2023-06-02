import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_project_test/widgets/easy_text_widget.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';

class ListTileDefault extends StatelessWidget {
  const ListTileDefault({
    Key? key,
    required this.imageURLForActor,
    required this.actorName,
    required this.genderId,
  }) : super(key: key);
  final String imageURLForActor;
  final String actorName;
  final int genderId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x, vertical: kSP5x),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: kSP35x,
            height: kSP50x,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(kSP20x)),
              child: CachedNetworkImage(
                imageUrl: imageURLForActor,
                fit: BoxFit.cover,
                placeholder: (context, url) => Image.asset(
                  kPlaceHolderImage,
                  fit: BoxFit.cover,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(
            width: kSP10x,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EasyText(
                text: (genderId == 2)
                    ? "Actor"
                    : (genderId == 1)
                        ? "Actress"
                        : "Crew",
                fontSize: kSP14x,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: kSP12x,
              ),
              EasyText(
                text: actorName,
                fontSize: kSP12x,
                textColor: kListTileTextColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
