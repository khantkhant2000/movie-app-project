import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';

class SliverAppBarMovieImageDefaultWidget extends StatelessWidget {
  const SliverAppBarMovieImageDefaultWidget({
    Key? key,
    required this.imageURL,
    required this.colorOpacityHeight,
    required this.textForTitle,
  }) : super(key: key);
  final String imageURL;
  final String textForTitle;
  final double colorOpacityHeight;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      title: Text(textForTitle),
      centerTitle: true,
      background: Stack(fit: StackFit.expand, children: [
        CachedNetworkImage(
          imageUrl: imageURL,
          fit: BoxFit.cover,
          placeholder: (context, url) => Image.asset(
            kPlaceHolderImage,
            fit: BoxFit.cover,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Positioned(
          left: kSP0x,
          bottom: kSP0x,
          right: kSP0x,
          height: colorOpacityHeight,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(kCO_09x),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
