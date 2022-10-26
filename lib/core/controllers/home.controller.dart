import 'package:get/get.dart';
import 'package:listen/routing/app_pages.routes.dart';

class HomeController extends GetxController {
  final currentTab = 0.obs;

  void navigateToPodcastPlayerView(String image) => Get.toNamed(
        AppRoutes.player,
        arguments: image,
      );
}
