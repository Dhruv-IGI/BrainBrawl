import 'dart:async';
import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';
import 'package:get/get.dart';
import 'package:quiver/async.dart';
import 'package:brainbrawl/app_data.dart';
import '../../../routes/app_pages.dart';
//import '../../login/views/login_view.dart';

class ResultsPageController extends GetxController {
  dynamic argumentData = Get.arguments;
  RxInt start = 20.obs ;
  RxInt current = 20.obs ;
 // RxBool isWinner = false.obs;

  @override
  void onInit() {
     WebAppReloadDetector.onReload(() {
      Get.toNamed(Routes.HOME);
    });
   // print("````" + argumentData['winner'][0]);
   // print("~~${player.value}");
    if (isCompetitionWinner.isFalse) {
      if (argumentData['winner'][0] == player.value) {
       // print("a");
        Timer(const Duration(seconds: 15),
                () async {
              await Get.toNamed(Routes.LEADERBOARD ,arguments: {
                'winner': [argumentData['winner'][0]],
              });
            // await Get.offAllNamed(Routes.PAIR);
            });
      }
      else {
      //  print("b");
        // Timer(const Duration(seconds: 6),
        //         () async {
        //           print(2);
        //           await Get.toNamed(Routes.COMPETITION);
        //     });
        Future.delayed(const Duration(seconds: 15), () async {
          await Get.toNamed(Routes.LEADERBOARD,arguments: {
            'winner': [argumentData['winner'][0]],
          });
          //await Get.offAllNamed(Routes.COMPETITION);
        },);
      }
      super.onInit();
    }
    else {
     // print("c");
     // print("`````````");

      Timer(const Duration(seconds: 15),
              () async {
                await Get.toNamed(Routes.LEADERBOARD,arguments: {
                  'winner': [argumentData['winner'][0]],
                });
               // await Get.offAllNamed(Routes.COMPETITION);
                isCompetitionWinner.value = false;
          });
      super.onInit();
    }
  }

  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: start.value),
      const Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      current.value = start.value - duration.elapsed.inSeconds;
      // print(current.value);
    });

    sub.onDone(() {
      //  current = 30;
      sub.cancel();
    });
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
