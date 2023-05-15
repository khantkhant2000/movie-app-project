import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constant/strings.dart';

class SliverAppBarActorImageDefaultWidget extends StatelessWidget {
  const SliverAppBarActorImageDefaultWidget({
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
      ]),
    );
  }
}
