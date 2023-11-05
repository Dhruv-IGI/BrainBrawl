import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../../app_data.dart';
import 'dart:async';
import 'dart:convert';
//import '../../login/views/login_view.dart';
import '../controllers/leaderboard_controller.dart';
//import '../../../routes/app_pages.dart';
//import 'package:flutter_svg/svg.dart';

class LeaderBoardView extends GetView<LeaderBoardController> {
  const LeaderBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.startTimer();
    return Scaffold(
        body: MediaQuery.of(context).size.width < 600
            ? Obx(
              () => controller.isLoaded.isTrue
                  ? Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 5.h),
                          child: SizedBox(
                            height: 90.h,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/logo.png',
                                        width: 300,
                                      ),
                                    ],
                                  ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      topLeft: Radius.circular(40),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.5),
                                        // spreadRadius: 2,
                                        // blurRadius: 4,
                                        // offset: const Offset(0, 2),
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          competitionName,
                                          style:  TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.sp),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Ranking",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        //Text("${controller.responseData["score"].length}",style: const TextStyle(color: Colors.white, fontSize: 20),),
                                        // const SizedBox(width: 10,),
                                        // const Text("(No. of Participants)",style: TextStyle(color: Colors.white, fontSize: 20),),
                                      ]),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // spreadRadius: 2,
                                    // blurRadius: 4,
                                    // offset: const Offset(0, 2),
                                  ),
                                ]),
                                height: 50.h,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0 , vertical: 10),
                                  child: ListView.builder(
                                      itemCount: controller
                                          .responseData["score"].length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          height: 10.h,
                                          width: Get.width,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: ExactAssetImage("assets/images/1.png"),
                                              fit: BoxFit.fill,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          child : Padding(
                                            padding:  EdgeInsets.symmetric(horizontal : 10.w),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children :[
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "#${index + 1}",
                                                      style: TextStyle(
                                                          color: const Color.fromRGBO(168, 85, 36, 1),
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 25.sp),
                                                    ),
                                                    SizedBox(
                                                      height: 1.5.h,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: 1.5.h,
                                                    ),
                                                    Text(
                                                          "${controller.responseData["score"][index]["user__username"]}",
                                                          style: const TextStyle(
                                                              color: Color.fromRGBO(168, 85, 36, 1),
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 25),)
                                                  ],
                                                ),
                                              ]
                                            ),
                                          )
                                        );

                                        // return ListTile(
                                        //   leading: Text(
                                        //     "${index + 1}",
                                        //     style: const TextStyle(
                                        //         color: Colors.white,
                                        //         fontSize: 25),
                                        //   ),
                                        //   title: Text(
                                        //     "${controller.responseData["score"][index]["user__username"]}",
                                        //     style: const TextStyle(
                                        //         color: Colors.green,
                                        //         fontSize: 25),
                                        //   ),
                                        //   // trailing: Text(
                                        //   //    "${controller.responseData["score"][index]["Score"]}",
                                        //   //    style: const TextStyle(color: Colors.white, fontSize: 25),
                                        //   //  ),
                                        // );
                                      }),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(
                                () => Text(
                                  "Redirecting in ${controller.current.value} seconds...",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 40),
                                ),
                              )
                            ]),
                          )),
                    ],
                  )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            )
            : Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Obx(
                  () => controller.isLoaded.isTrue
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 1.h),
                          child: SizedBox(
                            height: 100.h,
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(20),
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.grey.withOpacity(0.5),
                            //         spreadRadius: 2,
                            //         blurRadius: 4,
                            //         offset: const Offset(0, 2),
                            //       ),
                            //     ]),
                            child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        competitionName,
                                        style: GoogleFonts.spaceMono(
                                            color: Colors.white,
                                            fontSize: 40),
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                     Text(
                                        "Ranking",
                                        style: GoogleFonts.spaceMono(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      //Text("${controller.responseData["score"].length}",style: const TextStyle(color: Colors.white, fontSize: 20),),
                                      // const SizedBox(width: 10,),
                                      // const Text("(No. of Participants)",style: TextStyle(color: Colors.white, fontSize: 20),),
                                    ]),
                              ),
                              Container(
                                height: 70.h,
                                // decoration: BoxDecoration(boxShadow: [
                                //   BoxShadow(
                                    // color: Colors.grey.withOpacity(0.5),
                                    // spreadRadius: 2,
                                    // blurRadius: 4,
                                    // offset: const Offset(0, 2),
                                  // ),
                                // ]
                            // ),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage("assets/images/l2.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                // height: Get.height * 0.5,
                                width: Get.width / 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0),
                                  child: ListView.builder(
                                      itemCount: controller
                                          .responseData["score"].length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(horizontal : 1.w,vertical :1.h),
                                          child: Container(
                                            decoration : const BoxDecoration(
                                              image : DecorationImage(
                                                image: ExactAssetImage("assets/images/l1.png"),
                                                fit: BoxFit.fill,
                                                alignment: Alignment.center,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ListTile(
                                                leading: Text(
                                                  "${index + 1}",
                                                  style: GoogleFonts.spaceMono(
                                                      color: Colors.white,
                                                      fontSize: 25),
                                                ),
                                                title: Text(
                                                  "${controller.responseData["score"][index]["user__username"]}",
                                                  style: GoogleFonts.spaceMono(
                                                      color: Colors.white,
                                                      fontSize: 25),
                                                ),
                                                // trailing: Text(
                                                //    "${controller.responseData["score"][index]["Score"]}",
                                                //    style: const TextStyle(color: Colors.white, fontSize: 25),
                                                //  ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(
                                () => Text(
                                  "Redirecting in ${controller.current.value} seconds...",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 40),
                                ),
                              )
                            ]),
                          ))
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ));
  }
}
