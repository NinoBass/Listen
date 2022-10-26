import 'package:get/get.dart';
import 'package:listen/presentation/views.dart';

part 'app.routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const initialRoute = AppRoutes.home;

  static List<GetPage> list = [
    //home view
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeUi(),
    ),

    //podcast player view
    GetPage(
      name: AppRoutes.player,
      page: () => const PodcastPlayerUi(),
      // arguments: String image,
    ),
  ];
}
