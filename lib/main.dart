import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillmatrix/theme/themes.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(Sizer(
    builder : (context, orientation, deviceType) =>
        GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Skill Matrix",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: getBlackWhiteTheme(),
    ),
  ));
}
