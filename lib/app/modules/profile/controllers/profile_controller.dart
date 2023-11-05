import 'dart:async';
import 'dart:convert';
//import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:brainbrawl/app/modules/login/views/login_view.dart';
import '../../../routes/app_pages.dart';
//import '../../login/views/login_view.dart';
import 'package:http/http.dart' as http;
//import '../../login/controllers/login_controller.dart';
import '../../../../app_data.dart';


class ProfileController extends GetxController {
  RxBool isLoading = true.obs;
  late String stringResponse;
  RxString current_user = 'UserName'.obs ;


  @override
  Future<void> onInit() async {
    WebAppReloadDetector.onReload(() {
      Get.offAllNamed(Routes.HOME);
    });
    final prefs = await SharedPreferences.getInstance();
    current_user.value = prefs.getString('username_value')!;
    super.onInit();
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}