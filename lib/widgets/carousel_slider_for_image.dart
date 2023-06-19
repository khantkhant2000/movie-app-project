import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_project_test/constant/strings.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
import '../constant/api_constant.dart';
import '../constant/dimens.dart';

class CarouselSliderImage extends StatelessWidget {
  const CarouselSliderImage({
    super.key,
    this.aspectRatio = kCarouselSliderImageAspectRatio,
    this.unLargeCenterPage = true,
    required this.imagesURL,
    this.autoPlayImage = true,
    this.viewPortFraction = kCarouselSliderImageviewPortFraction,
    required this.widget,
  });

  final List<MovieVO>? imagesURL;
  final double aspectRatio;
  final bool unLargeCenterPage;
  final bool autoPlayImage;
  final double viewPortFraction;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: aspectRatio,
        viewportFraction: viewPortFraction,
        initialPage: kValueForInitialPage,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: autoPlayImage,
        autoPlayInterval: const Duration(seconds: kDurationSecond),
        autoPlayAnimationDuration:
            const Duration(milliseconds: kDurationMilliSecond),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: unLargeCenterPage,
        enlargeFactor: kEnlargeFactor,
        scrollDirection: Axis.horizontal,
      ),
      items: imagesURL?.map((url) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Builder(
              builder: (BuildContext context) {
                return SizedBox(
                  height: kSP380x,
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(kSP15x)),
                    child: Image.network(
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Image.asset(
                            kPlaceHolderImage,
                            fit: BoxFit.cover,
                          );
                        }
                      },
                      "$kNetWortPosterPath${url.posterPath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            Positioned(
              left: kSP0x,
              bottom: kSP0x,
              right: kSP0x,
              height: kSP380x,
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
            // const CircleAvatar(
            //   backgroundColor: kPlayIconBackgroundColor,
            //   child: Icon(
            //     Icons.play_arrow_outlined,
            //   ),
            // ),
            widget,
          ],
        );
      }).toList(),
    );
  }
}
