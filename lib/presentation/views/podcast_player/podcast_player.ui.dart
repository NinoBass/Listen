import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/core/controllers/player.controller.dart';
import 'package:listen/presentation/resources/res.dart';
import 'package:listen/presentation/widgets/spacing.dart';

class PodcastPlayerUi extends GetView {
  const PodcastPlayerUi({Key? key}) : super(key: key);

  @override
  PodcastPlayerController get controller => Get.put(PodcastPlayerController());

  @override
  Widget build(BuildContext context) {
    final tag = Get.arguments as String;
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
            padding: const EdgeInsets.symmetric(horizontal: 24) +
                const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: Get.back,
                  child: Image.asset(
                    homeIcon,
                    color: white,
                    width: 30,
                    height: 30,
                  ),
                ),
                const VerticalSpace(size: 48),
                Hero(
                  tag: tag,
                  transitionOnUserGestures: true,
                  child: Center(
                    child: Container(
                      width: context.width * .8,
                      height: context.width * .76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                          image: AssetImage(tag),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(size: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          hossannaFeatChike,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        VerticalSpace(size: 4),
                        Text(
                          masterkraft,
                          style: TextStyle(
                            fontSize: 16,
                            color: grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: semiDark.withOpacity(.70),
                      ),
                      child: const Icon(
                        Icons.more_horiz,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(size: 45),
                Container(
                  width: context.width,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: semiDark,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                const VerticalSpace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "2:25",
                      style: TextStyle(
                        color: grey,
                      ),
                    ),
                    Text(
                      "-3:18",
                      style: TextStyle(
                        color: grey,
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(size: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.skip_previous_rounded,
                        color: grey,
                        size: 36,
                      ),
                      const Icon(
                        Icons.replay_10_rounded,
                        color: grey,
                        size: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!controller.animation.isCompleted) {
                            controller.animation.forward();
                          } else {
                            controller.animation.reverse();
                          }
                        },
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: const BoxDecoration(
                            color: accentColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: accentColor,
                                blurRadius: 42,
                                blurStyle: BlurStyle.outer,
                                spreadRadius: -3,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: AnimatedIcon(
                            progress: controller.animation,
                            size: 52.0,
                            icon: AnimatedIcons.play_pause,
                            color: white,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.forward_10_rounded,
                        color: grey,
                        size: 30,
                      ),
                      const Icon(
                        Icons.skip_next_rounded,
                        color: grey,
                        size: 36,
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(size: 48),
                const Divider(
                  thickness: 1.0,
                  color: semiDark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
