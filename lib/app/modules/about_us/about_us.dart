//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/app_pages.dart';
import 'package:hovering/hovering.dart';
import 'package:gradient_borders/gradient_borders.dart';

String? finalToken = '';

class HomeView {


  //  void getRoute() async {
  //   await getValidationData().whenComplete(() async {
  //     if (finalToken == '') {
  //       return Get.toNamed(Routes.LOGIN);
  //     } else {
  //       return Get.toNamed(Routes.QUIZPAGE);
  //     }
  //   });
  // }
  //
  // Future getValidationData() async {
  //   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var obtainedToken = sharedPreferences.getString('token');
  //   finalToken = obtainedToken;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).size.width < 600
          ? const SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [

          ],
        ),
      )
          : Column(
          children: [
            Row(children: [
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 30.0, vertical: 1.h),
                child: Image.asset(
                  'assets/images/brainbrawl_logo.png',
                  width: 350,
                  height: 80,
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal :2.w),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.REGISTRATION);
                      },
                      child: HoverContainer(
                        hoverDecoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              //                   <--- left side
                              color: Color(0xFFE86E80),
                              width: 3.0,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'Register',
                            style: GoogleFonts.spaceMono(
                              color: Colors.white,
                              fontSize: 4.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: HoverContainer(
                        hoverDecoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              //                   <--- left side
                              color: Color(0xFFE86E80),
                              width: 3.0,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'Login',
                            style: GoogleFonts.spaceMono(
                              color: Colors.white,
                              fontSize: 4.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        // scrollToItem(itemKey3);
                      },
                      child: GestureDetector(
                        onTap: () {
                          // Get.toNamed(Routes.ABOUTUS);
                        },
                        child: HoverContainer(
                          hoverDecoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                //                   <--- left side
                                color: Color(0xFFE86E80),
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              'About Us',
                              style: GoogleFonts.spaceMono(
                                color: Colors.white,
                                fontSize: 4.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            ]),
            Center(
              heightFactor: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: Get.width * 0.3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal : 3.w),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 1.h),
                                child: Text(
                                  'Engage,',
                                  style: GoogleFonts.spaceMono(
                                    fontSize: 3.w,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 2.h),
                                child: Text(
                                  'Challenge,',
                                  style: GoogleFonts.spaceMono(
                                    fontSize: 3.w,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 2.h),
                                child: Text(
                                  'Triumph',
                                  style: GoogleFonts.spaceMono(
                                    fontSize: 3.w,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 5.h),
                                child: Text(
                                  'Join the Quiz Battle',
                                  style: GoogleFonts.specialElite(
                                    fontSize: 2.w,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 2.h),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.REGISTRATION);
                                  },
                                  child: Container(
                                      width: 20.w,
                                      height: 8.h,
                                      decoration: BoxDecoration(
                                          border: const GradientBoxBorder(
                                            gradient: LinearGradient(colors: [
                                              Color.fromARGB(154, 236, 140, 1),
                                              Color.fromARGB(221, 63, 243, 243),
                                              Color.fromARGB(120, 246, 77, 77),
                                              Color.fromARGB(44, 214, 48, 100)
                                            ]),
                                            width: 7,
                                          ),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "Register Now",
                                          style: GoogleFonts.spaceMono(
                                            fontSize: 1.8.w,
                                            fontWeight: FontWeight.w200,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // height: Get.height * 0.6,
                      child: Image.asset(
                        'assets/images/home_image.png',
                        // height: 40.w,
                        width: 80.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
