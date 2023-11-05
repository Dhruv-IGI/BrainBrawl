import 'dart:async';
import 'dart:convert';
//import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiver/async.dart';
import 'package:brainbrawl/app_data.dart';
import '../../../routes/app_pages.dart';
//import '../../login/views/login_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class DashboardController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isRegistered = false.obs;
  RxBool isRightTime = false.obs;
  RxBool isFirstClick = false.obs;
  late int length;
  dynamic argumentData = Get.arguments;
  RxInt start = 0.obs ;
  RxInt current = 0.obs ;
  late int timeDifference ;


  @override
  void onInit() async {
    //print(argumentData);
    await checkTime();
    start.value = timeDifference;
    current.value = timeDifference;
    startTimer();
    // print("start: $start");
    // print("current: $current");
    // print("timeDifference: $timeDifference");
   // print("Time before: ${DateTime.now()}");
    //start = int.parse(argumentData) * 60;
    Timer(Duration(seconds: timeDifference > 5 ? timeDifference - 5 : 0), () {
     // print("Time before: ${DateTime.now()}");
      checkTimeContinous();
    });
    // Future.delayed(const Duration(seconds: 5), () {
    //   isLoading.value = false;
    // });
    //print(argumentData);   //this is the data passed from the previous screen
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

  void checkTimeContinous() async {
    while(isRightTime.isFalse){
      await checkTime();
    //  print("Time is false");
    }
    Get.toNamed(Routes.PAIR);
  //  print("Time is right");
  }


  Future checkTime() async {
     List<String> time = await getTime();
     int hour = int.parse(time[0]);
     int minute = int.parse(time[1]);
     int second = int.parse(time[2]);
     timeDifference = ( competitionHour - hour ) * 3600 + (competitionMinute - minute  ) * 60 + (competitionSecond - second );
    if (hour >= competitionHour && minute >= competitionMinute && second >= competitionSecond) {
     isRightTime.value = true ;
    } else {
      isRightTime.value = false;
    }
  }

  Future<List<String>> getTime() async {
    List<String> time = [];
    final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    final currentTime = await http.get(Uri.parse("https://api.api-ninjas.com/v1/worldtime?timezone=$currentTimeZone" ), headers: {"X-Api-Key": "Rhm/aTnf2pLYUpIAIlClWQ==my1N1rjCZCboGRb8"});
    var currentTimeData = json.decode(currentTime.body);
    time.addAll([currentTimeData['hour'].toString() ,currentTimeData['minute'].toString() ,currentTimeData['second'].toString() ]);
    return time;
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

  // void uploadData() async {
  //   final response = await http.get(Uri.parse("https://127.0.0.1:8000/competition/"));
  //   var responseData = json.decode(response.body);
  //   if (response.statusCode == 200) {
  //     length = responseData.length;
  //
  //     Get.showSnackbar(const GetSnackBar(
  //       message: "Successfully Registered",
  //     ));
  //     isRegistered.value = true;
  //   } else {
  //     Get.showSnackbar(const GetSnackBar(
  //       message: "Something went wrong.. try again",
  //     ));
  //   }
  //
  //
  // }
}
