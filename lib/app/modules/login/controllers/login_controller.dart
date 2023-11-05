import 'dart:convert';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:brainbrawl/app_data.dart';
import '../../../routes/app_pages.dart';
import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';


class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';
  late String stringResponse;
 // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance() ;

  @override
  void onInit() {
    WebAppReloadDetector.onReload(() {
      Get.toNamed(Routes.HOME);
    });
    super.onInit();
  }

  void submitForm() async {
    final prefs = await SharedPreferences.getInstance();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://hackcbs-backend.onrender.com/login/'));
      request.fields.addAll({'username': username, 'password': password});
      http.StreamedResponse response = await request.send();
      stringResponse = await response.stream.bytesToString();
      // print(stringResponse);
      // print(response.statusCode);
      // print(username + password);
      if (response.statusCode == 200) {
        final json = await jsonDecode(stringResponse);
        if (json['access_token'] != null) {
         // var token = json['access_token'];
         // final SharedPreferences? prefs = await _prefs ;
         // await prefs?.setString('token', json['access_token']);
          accessToken = json['access_token'];
          userId = json['user_id'];
          await prefs.setInt('userId',json['user_id']);
          // print(prefs.getInt('userId'));
          // print(prefs.getString('username_value'));
          Get.toNamed(Routes.COMPETITION);
         } else {
          Get.showSnackbar(const GetSnackBar(
            message: "Something went wrong.. try again",
          ));
        }
      } else {
        if (stringResponse.contains('error')) {
          Get.showSnackbar(const GetSnackBar(
            duration: Duration(seconds: 2),
            message: "Invalid username or password !!!",
          ));
        } else {
          Get.showSnackbar(const GetSnackBar(
            duration: Duration(seconds: 2),
            message: "Invalid username or password !!!",
          ));
        }
      }
    }
  }

  // login() async {
  //   try {
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     User? user = userCredential.user;
  //     // print('User logged in: ${user?.email}');
  //     Get.toNamed(Routes.DASHBOARD);
  //   } on FirebaseAuthException catch (e) {
  //     String msg = "";
  //     if (e.code == 'user-not-found') {
  //       msg = 'No user found with this email.';
  //     } else if (e.code == 'wrong-password') {
  //       msg = 'Invalid password.';
  //     } else {
  //       msg = e.message ?? "";
  //     }
  //     Get.showSnackbar(GetSnackBar(
  //       title: "Login failed",
  //       message: msg,
  //       duration: const Duration(seconds: 1),
  //     ));
  //   }
  // }
}
