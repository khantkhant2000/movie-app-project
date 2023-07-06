import 'package:flutter/material.dart';
import 'package:movie_app_project_test/widgets/is_loading_widget.dart';
import 'package:provider/provider.dart';
import '../../bloc/search_movie_page_bloc.dart';
import '../../constant/api_constant.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../data/vos/search_movie_vo/search_movie_vo.dart';
import '../../pages/movie_info_page.dart';
import '../../widgets/easy_text_widget.dart';

/// back text button  session
class BackTextItemView extends StatelessWidget {
  const BackTextItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSP10x, top: kSP35x),
      child: TextButton.icon(
          icon: const Icon(Icons.arrow_back_ios,
              size: 14, color: kSearchIconBackgroundColor),
          style: TextButton.styleFrom(
            iconColor: kSearchIconBackgroundColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          label: const EasyText(
            text: kBackText,
            fontSize: kFS15x,
            textColor: kSearchIconBackgroundColor,
          )),
    );
  }
}

/// Search Movie Text Field and Movie Searching Session
class SearchMoviesTextFieldItemView extends StatelessWidget {
  const SearchMoviesTextFieldItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SearchMoviePageBloc, List<SearchMovieResultVO>?>(
      selector: (_, bloc) => bloc.searchMovieList,
      builder: (_, bloc, __) => (bloc == null)
          ? const IsLoadingWidget()
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSP15x),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const TextFieldWidget(),
                      const SizedBox(
                        width: kSP15x,
                      ),
                      Container(
                        height: kSP54x,
                        width: kSP54x,
                        decoration: const BoxDecoration(
                            color: kSearchIconBackgroundColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(kSP10x))),
                        child: const Icon(Icons.search,
                            color: kSearchIconColor, size: kFS25x),
                      ),
                    ],
                  ),
                ),
                SearchMovieListView(
                  searchMovieList: bloc,
                )
              ],
            ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        style: const TextStyle(color: Colors.white70),
        onChanged: (text) {
          final instance = context.read<SearchMoviePageBloc>();
          instance.searchMovieName(text);
        },
        textInputAction: TextInputAction.search,
        autofocus: true,
        enabled: true,
        decoration: const InputDecoration(
          hintText: kSearchMovies,
          hintStyle: TextStyle(color: kSearchMovieColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(kSP19x)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(kSP19x)),
          ),
          fillColor: kSearchBarBackgroundColor,
          filled: true,
        ),
      ),
    );
  }
}

class SearchMovieListView extends StatelessWidget {
  const SearchMovieListView({super.key, required this.searchMovieList});
  final List<SearchMovieResultVO> searchMovieList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchMovieList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: kSP12x),
            child: SizedBox(
              height: kSP80x,
              child: Card(
                  color: kSearchBarBackgroundColor,
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 0, right: 10),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetailPage(
                              movieId: searchMovieList[index].id ?? 0)));
                    },
                    leading: Image.network(
                      "$kNetWortPosterPath${searchMovieList[index].posterPath ?? ''}",
                      fit: BoxFit.fill,
                    ),
                    title: Text(
                      searchMovieList[index].title ?? '',
                      style: const TextStyle(
                          color: Colors.white, fontSize: kSP14x),
                    ),
                    subtitle: Text((searchMovieList[index].overview ?? ''),
                        style: const TextStyle(
                            color: Colors.white70, fontSize: kFS12x),
                        overflow: TextOverflow.ellipsis),
                    trailing: Container(
                      width: kSP60x,
                      height: kSP40x,
                      color: kDateColorForSearchMovies,
                      child: Center(
                        child: EasyText(
                          text: (searchMovieList[index].getReleaseData(
                              searchMovieList[index].releaseDate)),
                        ),
                      ),
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
