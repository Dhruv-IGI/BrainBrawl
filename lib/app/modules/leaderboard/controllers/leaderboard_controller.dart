import 'dart:async';
import 'dart:convert';
import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';
import 'package:get/get.dart';
import 'package:quiver/async.dart';
import 'package:brainbrawl/app_data.dart';
import '../../../routes/app_pages.dart';
import 'package:http/http.dart' as http;
//import '../../login/views/login_view.dart';

class LeaderBoardController extends GetxController {
  dynamic argumentData = Get.arguments;
  RxInt start = 20.obs ;
  RxInt current = 20.obs ;
  var responseData;
  RxBool isLoaded = false.obs;

  @override
  void onInit() async{
    super.onInit();
     WebAppReloadDetector.onReload(() {
      Get.offAllNamed(Routes.HOME);
    });
    final response = await http.get(
        Uri.parse("https://hackcbs-backend.onrender.com/score/"));
    responseData = json.decode(response.body.toString());
    responseData = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      // print("11"+responseData["score"].length.toString());
      // print("22"+responseData["score"].toString());
      // print("33"+responseData.toString());
      //print(response.body);
      isLoaded.value = true;
    }

        // Timer(const Duration(seconds: 15),
        //         () async {
        //      await Get.offAllNamed(Routes.PAIR);
        //     });
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
      if (isCompetitionWinner.isFalse) {
        if (argumentData['winner'][0] == player.value) {
          // print("a");
          // Timer(const Duration(seconds: 20),
          //         () async {
                // await Get.toNamed(Routes.LEADERBOARD ,arguments: {
                //   'winner': [argumentData['winner'][0]],
                // });
                // await
                Get.offAllNamed(Routes.PAIR);
              // });
        }
        else {
          //  print("b");
          // Timer(const Duration(seconds: 6),
          //         () async {
          //           print(2);
          //           await Get.toNamed(Routes.COMPETITION);
          //     });
          // Future.delayed(const Duration(seconds: 20), () async {
            // await Get.toNamed(Routes.LEADERBOARD,arguments: {
            //   'winner': [argumentData['winner'][0]],
            // });
            // await
            Get.offAllNamed(Routes.COMPETITION);
          // },);
        }
        super.onInit();
      }
      else {
        // print("c");
        // print("`````````");

        // Timer(const Duration(seconds: 20),
        //         () async {
              // await Get.toNamed(Routes.LEADERBOARD,arguments: {
              //   'winner': [argumentData['winner'][0]],
              // });
              // await
              Get.offAllNamed(Routes.COMPETITION);
              isCompetitionWinner.value = false;
            // });
        super.onInit();
      }
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
