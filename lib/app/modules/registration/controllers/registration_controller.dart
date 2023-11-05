import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class RegistrationController extends GetxController {
  final formKey1 = GlobalKey<FormState>();

  String userName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  late String stringResponse;
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
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

  @override
  void dispose() {
    super.dispose();
  }
  Future<void> callRegApi() async {
    isLoading.value = true;
    if (formKey1.currentState!.validate()) {
      formKey1.currentState!.save();
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://hackcbs-backend.onrender.com/register/'));
      request.fields.addAll({
        'username': userName,
        'email': email,
        'password': password
      });

      http.StreamedResponse response = await request.send();
      stringResponse = await response.stream.bytesToString();
      if (response.statusCode == 201) {
        final json = await jsonDecode(stringResponse);
       // print(json);
        if (json['msg'] == "Registeration ok") {
          //final SharedPreferences prefs = await _prefs;
          //prefs.setString('token', json['token']["access"]);
          Get.showSnackbar(const GetSnackBar(
            message: "Account Created Successfully",
            duration: Duration(seconds: 2),
          ));
          Get.showSnackbar(const GetSnackBar(
            message: "Redirecting to Login Page....",
            duration: Duration(seconds: 2),
          ));
          Timer(const Duration(seconds: 5), () {
            isLoading.value = false;
          Get.toNamed(Routes.LOGIN);
          });
          dispose();
          onClose();
      }
        } else {
        if (stringResponse.contains('email') && stringResponse.contains('username')){
          Get.showSnackbar(const GetSnackBar(
            message: "Your username is not unique and email is already registered....Try Again",
            duration: Duration(seconds: 3),
          ));
          Timer(const Duration(seconds: 3), () {
            isLoading.value = false;
            Get.toNamed(Routes.REGISTRATION);
          });
          // onClose();
          // dispose();
        }

        else if (stringResponse.contains('username')){
          Get.showSnackbar(const GetSnackBar(
            message: "A user with that username already exists.....Try Again",
            duration: Duration(seconds: 2),
          ));
          Timer(const Duration(seconds: 3), () {
          isLoading.value = false;
            Get.toNamed(Routes.REGISTRATION);
          });
          // onClose();
          // dispose();
        }
        else if (stringResponse.contains('non_field_errors')){
          Get.showSnackbar(const GetSnackBar(
            message: "Email is already registered....Try Again",
            duration: Duration(seconds: 2),
          ));
          Timer(const Duration(seconds: 3), () {
            isLoading.value = false;
            Get.toNamed(Routes.REGISTRATION);
          });
          // onClose();
          // dispose();
        }
        else if(stringResponse.contains('email')){
          Get.showSnackbar(const GetSnackBar(
            message: "Invalid Email....Try Again",
            duration: Duration(seconds: 2),
          ));
          Timer(const Duration(seconds: 3), () {
            isLoading.value = false;
            Get.toNamed(Routes.REGISTRATION);
          });
          // onClose();
          // dispose();
        }
        }
    }
  }
}