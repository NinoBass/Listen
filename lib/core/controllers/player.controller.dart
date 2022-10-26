import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PodcastPlayerController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animation;

  @override
  void onInit() {
    super.onInit();

    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }
}
