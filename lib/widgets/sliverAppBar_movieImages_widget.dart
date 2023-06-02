import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';
import 'package:movie_app_project_test/widgets/easy_text_widget.dart';
import '../constant/api_constant.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import 'genres_name_widget.dart';

class SliverAppBarMovieImageDefaultWidget extends StatelessWidget {
  const SliverAppBarMovieImageDefaultWidget({
    Key? key,
    required this.colorOpacityHeight,
    required this.genresList,
    required this.movieDetailResponse,
  }) : super(key: key);

  final double colorOpacityHeight;
  final List<GenresVO> genresList;
  final MovieDetailResponse? movieDetailResponse;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      title: Text(
        movieDetailResponse?.title ?? '',
        style: const TextStyle(fontSize: 13),
      ),
      centerTitle: true,
      background: Stack(fit: StackFit.expand, children: [
        CachedNetworkImage(
          imageUrl:
              "$kNetWortPosterPath${movieDetailResponse?.posterPath ?? ''}",
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //ဒီနေရာမှာ GenresMovieNameWidget ထဲမှာ ListViewBuilder ကြောင့် error ဖြစ်နေတာပါ
                // Row ထဲမှာ ListViewBuilder ကိုသုံးရင် width height လိုပါတယ်
                // အဲ့တော့ အာ့က်ိုမသုံးပဲ genreList ကို Row ထဲမှာ map လုပ်ပြီးပြထားပါတယ်
                Row(
                  children: genresList
                      .map((e) => EasyText(
                          text: "${e.name} |",
                          fontSize: 12,
                          textColor: kMovieTypeGenresColor))
                      .toList(),
                ),
                EasyText(
                    text: "${(movieDetailResponse?.runtime ?? 0) ~/ 60} h  ",
                    fontSize: 12,
                    textColor: kMovieTypeGenresColor),
                EasyText(
                    text: "${(movieDetailResponse?.runtime ?? 0) % 60} m",
                    fontSize: 12,
                    textColor: kMovieTypeGenresColor),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
