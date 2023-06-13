import 'package:flutter/material.dart';
import 'package:movie_app_project_test/widgets/easy_text_widget.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({super.key});

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBodyBackgroundColor,
      body: const SearchMoviePageItemView(),
    );
  }
}

class SearchMoviePageItemView extends StatelessWidget {
  const SearchMoviePageItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackTextItemView(),
          SearchMoviesTextFieldItemView(),
        ],
      ),
    );
  }
}

class BackTextItemView extends StatelessWidget {
  const BackTextItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSP5x, top: kSP35x),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: kSP15x,
            ),
            child: Icon(Icons.arrow_back_ios,
                size: 14, color: kSearchIconBackgroundColor),
          ),
          TextButton(
              style: TextButton.styleFrom(
                iconColor: kSearchIconBackgroundColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const EasyText(
                text: "Back",
                fontSize: kFS15x,
                textColor: kSearchIconBackgroundColor,
              )),
        ],
      ),
    );
  }
}

class SearchMoviesTextFieldItemView extends StatelessWidget {
  const SearchMoviesTextFieldItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP15x),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const SizedBox(
          //     width: kSP270x,
          Expanded(
              child: TextField(
            style: const TextStyle(color: Colors.white70),
            onChanged: (text) {
              debugPrint("this is text from TextBox===> $text");
            },
            textInputAction: TextInputAction.search,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Search Movies...",
              hintStyle: TextStyle(color: kSearchMovieColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(kSP19x)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(kSP19x)),
                  borderSide: BorderSide(color: Colors.black)),
              fillColor: kSearchBarBackgroundColor,
              filled: true,
            ),
          )),
          const SizedBox(
            width: kSP15x,
          ),
          Container(
            height: kSP55x,
            width: kSP55x,
            decoration: const BoxDecoration(
                color: kSearchIconBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(kSP10x))),
            child:
                const Icon(Icons.search, color: kSearchIconColor, size: kFS25x),
          )
        ],
      ),
    );
  }
}
