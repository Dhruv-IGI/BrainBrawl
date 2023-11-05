import 'dart:convert';
import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../app_data.dart';
import '../../../routes/app_pages.dart';
import '../Models/CompetitionModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_native_timezone/flutter_native_timezone.dart';
//import 'package:quiver/async.dart';
//import '../views/competition_view.dart';
//import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:skillmatrix/app_data.dart';
//import '../../../routes/app_pages.dart';
//import '../../../routes/app_pages.dart';


class CompetitionController extends GetxController {

  RxBool isLoading = true.obs;
  RxBool isButtonEnable = false.obs;
  late int length;
  List<CompetitionModel> competitions = [];
  RxList isRightTime = [].obs;
  late String stringResponse;

  @override
  Future<void> onInit() async {
    final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
    userId = prefs.getInt('userId') ?? userId;
    WebAppReloadDetector.onReload(() {
      Get.offAllNamed(Routes.COMPETITION);
    });
    //
    // questionData = [];
    // matchId = '';
    // player = ''.obs;
    // opponent = ''.obs;
    // score = 0.0;
    // participantId = '';
    // competitionId = '';
    // competitionHour = 0;
    // competitionMinute = 0;
    // competitionSecond = 0;
    // participantLevel = 0;
    // isCompetitionWinner = false.obs;

    // timeFromApi = (await getTime()) as DateTime;
    // print(timeFromApi);
    Future.delayed(const Duration(seconds: 5), () {
    //   // print("10 sec khtm");
      isLoading.value = false;
    //   // for (int i = 0; i < competitions.length; i++) {
    //   //   isRightTime.add(false);
    //   //   //start[i] = competitionDateTime[i].difference(timeFromApi).inSeconds;
    //   //   current[i] = start[i];
    //   //   startTimer(i);
    //   // }
     });
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

  Future<List<CompetitionModel>> getCompetitionData() async {
    final response = await http.get(
        Uri.parse("http://127.0.0.1:8000//admincompetition/"));
    var responseData = json.decode(response.body.toString());
    // var responseData = [
    //   {
    //     "competition_id": "a2696b9a-d85c-462f-adc5-7fe6a12af41b",
    //     "competition": "test",
    //     "time": "2023-07-10 16:35:29",
    //     "room_time": 5,
    //     "level": 100,
    //     "left_level": 0
    //   }
    // ];
    // print(responseData);
    if (response.statusCode == 200) {
      for (Map i in responseData) {
        competitions.add(CompetitionModel.fromJson(i));
      }
      isLoading.value = false;
      return competitions;
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: "Something went wrong.. try again",
      ));
      return competitions;
    }
  }

  Future<void> registerParticipant(String competitionId1) async {
    // print("id yeh hai $competitionId");
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:8000/participantview/'));
    request.fields.addAll({
      "user": userId.toString(),
      "competition": competitionId1,
    });
    http.StreamedResponse response = await request.send();
    stringResponse = await response.stream.bytesToString();
    print(stringResponse);
    print("${response.statusCode} $userId $competitionId1");
    if (response.statusCode == 201) {
      final json = await jsonDecode(stringResponse);
      participantId = json["participant_id"]!;
      //participantLevel = json["level"]!;
      competitionId = competitionId1;
      //userId = json["user"]!;
      Get.showSnackbar(const GetSnackBar(
        message: "You have registered successfully",
        duration: Duration(seconds: 2),
      ));
    }
      else {
        Get.showSnackbar(const GetSnackBar(
          message: "Something went wrong.. try again",
          duration: Duration(seconds: 2),
        ));
      }
    }

    void competitionTime(DateTime competitionDateTime, int roomTime) {
      competitionHour = competitionDateTime.hour;
      competitionMinute = competitionDateTime.minute + roomTime;
      competitionSecond = competitionDateTime.second;
    }

    // void startTimer(int index) {
    //   CountdownTimer countDownTimer = CountdownTimer(
    //     Duration(seconds: start[index]),
    //     const Duration(seconds: 1),
    //   );
    //
    //   var sub = countDownTimer.listen(null);
    //   sub.onData((duration) {
    //     current[index] = start[index] - duration.elapsed.inSeconds;
    //   });
    //
    //   sub.onDone(() {
    //     isRightTime[index] = true;
    //     sub.cancel();
    //   });
    // }


    // Future checkTime() async {
    //   List<String> time = await getTime();
    //   int hour = int.parse(time[0]);
    //   int minute = int.parse(time[1]);
    //   int second = int.parse(time[2]);
    //   if (hour >= 00 && minute >= 00 && second >= 00) {
    //     isRightTime.value = true ;
    //   } else {
    //     isRightTime.value = false;
    //   }
    // }

    // Future<String> getTime() async {
    //   final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    //   final currentTime = await http.get(Uri.parse("https://api.api-ninjas.com/v1/worldtime?timezone=$currentTimeZone" ), headers: {"X-Api-Key": "9fHJLaA5qIjSfWOiL0luVg==uDwiqx2ifzs53Af9"});
    //   var currentTimeData = json.decode(currentTime.body);
    //   return currentTimeData["currentDateTime"].toString();
    // }

    //TODO: IMPLEMENT TIMER FOR COMPETITION

    // List<int> convertSecondsToHMS(int seconds) {
    //   int hours = seconds ~/ 3600;
    //   seconds %= 3600;
    //
    //   int minutes = seconds ~/ 60;
    //   seconds %= 60;
    //
    //   return [hours, minutes, seconds];
    // }

}