import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_project_test/constant/strings.dart';
import '../constant/api_constant.dart';
import '../constant/dimens.dart';
import '../data/vos/actor_result_vo/actor_result_vo.dart';
import '../pages/actor_and_actress_info_page.dart';
import 'easy_text_widget.dart';

class CarouselSliderForActor extends StatelessWidget {
  const CarouselSliderForActor({
    super.key,
    this.aspectRatio = kCarouselSliderImageAspectRatio,
    this.unLargeCenterPage = true,
    required this.imagesURL,
    this.autoPlayImage = true,
    this.viewPortFraction = kCarouselSliderImageviewPortFraction,
    required this.id,
  });

  final List<ActorResultsVO>? imagesURL;
  final double aspectRatio;
  final bool unLargeCenterPage;
  final bool autoPlayImage;
  final double viewPortFraction;
  final int id;
  @override
  Widget build(BuildContext context) {
    // print("this is index of actor name=====>$imagesURL");
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
                      "$kNetWortPosterPath${url.profilePath}",
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
            Padding(
              padding: const EdgeInsets.only(top: kSP280x),
              child: EasyText(
                text: url.name ?? "",
              ),
            ),
            Positioned.fill(child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ActorDetailPage(
                          id: url.id ?? 0,
                        )));
              },
            )),
          ],
        );
      }).toList(),
    );
  }
}
