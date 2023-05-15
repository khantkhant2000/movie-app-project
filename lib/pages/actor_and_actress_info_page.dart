import 'package:flutter/material.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../view_items/actor_and_actress_info_page_view_items/actor_and_actress_info_page_view_items.dart';
import '../widgets/sliverAppBar_ActorImage_widget.dart';

class ActorAndActressInfoPage extends StatelessWidget {
  const ActorAndActressInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
                shape: Border(bottom: BorderSide.none),
                pinned: true,
                floating: true,
                expandedHeight: kSP380x,
                backgroundColor: Colors.black,
                flexibleSpace: SliverAppBarActorImageDefaultWidget(
                  imageURL: kActorAndActressImageURL,
                  colorOpacityHeight: kSP350x,
                  textForTitle: kActorName,
                )),
          ],
          body: const SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BiographyItemView(),
              MoreInformationItemView(),
              KnownForItemView()
            ],
          )),
        ));
  }
}
