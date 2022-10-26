import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:listen/core/controllers/home.controller.dart';
import 'package:listen/core/data/podcasts/podcasts.data.dart';
import 'package:listen/presentation/resources/res.dart';
import 'package:listen/presentation/views/home/widgets/podcast_tile.ui.dart';
import 'package:listen/presentation/widgets/spacing.dart';

class HomeUi extends GetView {
  const HomeUi({Key? key}) : super(key: key);

  @override
  HomeController get controller => Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  helloAfolabi,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ).paddingSymmetric(horizontal: 24.0),
                const VerticalSpace(),
                const Text(
                  whatDoYouWantToHearToday,
                  style: TextStyle(
                    color: grey,
                    fontWeight: FontWeight.w400,
                  ),
                ).paddingSymmetric(horizontal: 24.0),
                const VerticalSpace(size: 16),
                TextField(
                  cursorColor: accentColor,
                  decoration: InputDecoration(
                    hintText: searchPodcast,
                    isDense: true,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Iconify(
                        Bx.bx_search_alt,
                        color: grey,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0) +
                          const EdgeInsets.only(right: 16.0),
                      child: Image.asset(
                        slider,
                        color: white,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minHeight: 36,
                      minWidth: 36,
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minHeight: 36,
                      minWidth: 36,
                    ),
                  ),
                ).paddingSymmetric(horizontal: 24.0),
                const VerticalSpace(size: 30),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: categories.asMap().entries.map((category) {
                        return GestureDetector(
                          onTap: () {
                            controller.currentTab(category.key);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            alignment: Alignment.center,
                            constraints: const BoxConstraints(minWidth: 70),
                            child: Column(
                              children: [
                                Text(
                                  category.value,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: controller.currentTab.value ==
                                            category.key
                                        ? white
                                        : grey,
                                    fontWeight: category.key == 0
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                                if (controller.currentTab.value ==
                                    category.key) ...[
                                  const VerticalSpace(),
                                  Container(
                                    height: 3,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: accentColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const VerticalSpace(size: 16),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) =>
                        const HorizontalSpace(size: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: 2,
                    itemBuilder: (_, index) {
                      final bg = index.isEven ? hosanna : kwaku;
                      return Hero(
                        tag: bg,
                        transitionOnUserGestures: true,
                        child: GestureDetector(
                          onTap: () {
                            //navigate to player view
                            controller.navigateToPodcastPlayerView(bg);
                          },
                          child: Container(
                            width: 280,
                            height: 180,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(16.0),
                              image: DecorationImage(
                                image: AssetImage(bg),
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const VerticalSpace(size: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        recentlyPlayed,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        seeAll,
                        style: TextStyle(
                          color: grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(size: 16),
                ...recentlyPlayedPodcasts.asMap().entries.map((element) {
                  return PodcastTileUi(
                    podcast: recentlyPlayedPodcasts[element.key],
                  ).marginOnly(bottom: 16.0);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final categories = <String>[
  recommendation,
  trending,
  business,
  crypto,
];
