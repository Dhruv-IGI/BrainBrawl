import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:sizer/sizer.dart';
import '../../../routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:loading_indicator/loading_indicator.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.of(context).size.width < 600
            ?  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                children: [
                   Text(
                    "Waiting for other participants to join",
                    style: GoogleFonts.spaceMono(
                        fontSize: 5.h,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                   SizedBox(
                    height: 15.h,
                    child: const LoadingIndicator(
                      indicatorType:
                      Indicator.ballClipRotateMultiple,
                      colors: [Colors.white],
                      strokeWidth: 4.0,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(right: 7.5.w),
                  //   child: Image.asset(
                  //     "assets/images/Knockout.png",
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Obx(() => Text(
                      "Please Wait ${controller.current} seconds",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.spaceMono(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
                ],
                ),
            )
            : Center(
                // child: AspectRatio(
                //   aspectRatio: 21 / 9,
                //   child: Container(
                //     height: double.maxFinite,
                //     width: double.maxFinite,
                //     decoration: const BoxDecoration(
                //       image: DecorationImage(
                //         image: ExactAssetImage("assets/images/Knockout.jpg"),
                //         fit: BoxFit.fill,
                //         alignment: Alignment.center,
                //       ),
                //     ),
                    child: ClipRRect(
                      // make sure we apply clip it properly
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.grey.withOpacity(0.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Waiting for other participants to join",
                                style: GoogleFonts.spaceMono(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              const SizedBox(
                                height: 200,
                                child: LoadingIndicator(
                                  indicatorType:
                                      Indicator.ballClipRotateMultiple,
                                  colors: [Colors.white],
                                  strokeWidth: 4.0,
                                ),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              Obx(() => Text(
                                  "Please Wait ${controller.current} seconds",
                                  style: GoogleFonts.spaceMono(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                // ),
              // )
    );
    // )
    // );
  }
}
