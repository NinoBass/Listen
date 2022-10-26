import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:listen/presentation/resources/colors.res.dart';
import 'package:listen/routing/app_pages.routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      //This has to be dark so the texts can be white
      statusBarBrightness: Brightness.dark, //For IOS
      statusBarIconBrightness: Brightness.dark, //For Android
      statusBarColor: dark,
    ),
  );
  runApp(const Listen());
}

class Listen extends StatelessWidget {
  const Listen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listen to Podcasts',
      getPages: AppPages.list,
      initialRoute: AppPages.initialRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: dark,
        brightness: Brightness.dark,
        fontFamily: "ProximaSoft",
        textTheme: Typography.englishLike2018.apply(
          fontFamily: "ProximaSoft",
          bodyColor: white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: grey,
          ),
          fillColor: semiDark,
          filled: true,
          errorStyle: const TextStyle(fontSize: 0, height: 0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: semiDark,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: semiDark,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: semiDark,
            ),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
