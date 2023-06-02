import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_project_test/constant/dimens.dart';

import '../constant/colors.dart';
import '../constant/strings.dart';
import 'easy_text_widget.dart';

class PCWidget extends StatelessWidget {
  const PCWidget({Key? key, required this.imageURL, required this.name})
      : super(key: key);
  final String imageURL;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSP12x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kSP5x),
            child: SizedBox(
              width: kSP90x,
              height: kSP80x,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(kSP20x)),
                child: CachedNetworkImage(
                  imageUrl: imageURL,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Image.asset(
                    kPlaceHolderImage,
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          const SizedBox(height: kSP10x),
          EasyText(
            text: name,
            fontSize: kFS12x,
            fontWeight: FontWeight.w400,
            textColor: kMarvelStudioTextColor,
          ),
        ],
      ),
    );
  }
}
