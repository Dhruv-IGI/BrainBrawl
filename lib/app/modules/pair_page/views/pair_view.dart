import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/pair_controller.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import '../../../../app_data.dart';

Random random = Random();

class PairView extends GetView<PairController> {
  const PairView({Key? key}) : super(key: key);
  final List<String> imagePaths = const [
    'assets/participants/1.png',
    'assets/participants/2.png',
    'assets/participants/3.png',
    'assets/participants/4.png',
    'assets/participants/5.png',
    'assets/participants/6.png',
    // Add more image paths here
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Obx(
            () => controller.isLoading.value
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Obx(()=> Text("$round",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),),),
                      SizedBox(
                        height: 200,
                        child: ScrollLoopAutoScroll(
                          gap: 0,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              makePhotoCard(0),
                              makePhotoCard(1),
                              makePhotoCard(2),
                              makePhotoCard(3),
                              makePhotoCard(4),
                              makePhotoCard(5),
                              // makePhotoCard(6),
                              // makePhotoCard(7),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        "Finding Opponent.....",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 200,
                        child: ScrollLoopAutoScroll(
                          reverseScroll: true,
                          gap: 0,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              makePhotoCard(0),
                              makePhotoCard(1),
                              makePhotoCard(2),
                              makePhotoCard(3),
                              makePhotoCard(4),
                              makePhotoCard(5),
                              // makePhotoCard(6),
                              // makePhotoCard(7),
                            ],
                          ),
                        ),
                      ),
                      const Text(""),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Text(
                        player.value,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 170,
                        child: makePhotoCard(random.nextInt(6)),
                      ),
                      const Text(
                        "V/S",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 170,
                        child: makePhotoCard(random.nextInt(6)),
                      ),
                      Text(
                        opponent.value,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
    //Obx(
    // () => controller.isRegistered.isTrue
    //     ? const Center(
    //         child: SizedBox(
    //           height: 200,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Text(
    //                 "Waiting for other participants to join",
    //                 style: TextStyle(
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.white),
    //                 textAlign: TextAlign.center,
    //               ),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               CircularProgressIndicator(),
    //             ],
    //           ),
    //         ),
    //       )
    //     :
    //() =>
  }

  Widget makePhotoCard(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          imagePaths[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
