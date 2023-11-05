import 'dart:async';
import 'dart:convert';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:brainbrawl/app/modules/login/views/login_view.dart';
import 'package:brainbrawl/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import '../../../../app_data.dart';
import 'package:quiver/async.dart';

class QuizpageController extends GetxController {
  late PageController pageController;
  int currentPageIndex = 0;
  RxBool isFinalQuestion = false.obs;
  RxBool isLoading = false.obs;
  RxBool isOptionSelected = false.obs;
  RxBool isAnswerCorrect = false.obs;
  RxBool isTimeOver = false.obs;
  int start = 15;
  RxInt current = 15.obs;
  int start1 = 60;
  RxInt current1 = 60.obs;
 // late String stringResponse;

  // Future getQuestions() async {      // TODO: remove this method
  //   // final response = await http.get(Uri.parse("https://hackcbs-backend.onrender.com//questions/$participantLevel"));   //TODO: add level to link
  //   // if (response.statusCode == 200) {
  //   //   questionData = json.decode(response.body);
  //   final response = await rootBundle.loadString('assets/json/sql.json');
  //   // print(response);
  //   var responseData = json.decode(response);
  //   //  print(responseData);
  //
  //
  //   // questionData = responseData['level$participantLevel'];   TODO: remove comment
  //
  //   questionData = responseData['level1'];
  //
  //   print(questionData);
  //   //  print(questionData.isEmpty);
  //   // questionData = [
  //   //   {
  //   //     "question_id": "8647d621-f28d-4eaf-858e-672dbb9dcc5d",
  //   //     "question_text": "what is c stands for",
  //   //     "choice1": "apple",
  //   //     "choice2": "ball",
  //   //     "choice3": "cat",
  //   //     "choice4": "dog",
  //   //     "correct_ans": "cat",
  //   //     "level": 1
  //   //   } ,
  //   //   {
  //   //     "question_id": "8647d621-f28d-4eaf-858e-672dbb9dcc5c",
  //   //     "question_text": "what is a stands for",
  //   //     "choice1": "apple",
  //   //     "choice2": "ball",
  //   //     "choice3": "cat",
  //   //     "choice4": "dog",
  //   //     "correct_ans": "apple",
  //   //     "level": 1
  //   //   }
  //   // ];
  //   // }
  //   if(questionData.isEmpty) {
  //     Get.showSnackbar(const GetSnackBar(
  //       message: "Could not fetch data",
  //     ));
  //   }
  //   // }
  // }


  Future getQuestions() async {
    // final response = await http.get(Uri.parse("https://hackcbs-backend.onrender.com//questions/$participantLevel"));   //TODO: add level to link
    // if (response.statusCode == 200) {
    //   questionData = json.decode(response.body);
    final response = await rootBundle.loadString('assets/json/abc.json');
    // print(response);
    var responseData = json.decode(response);
    //  print(responseData);


    // questionData = responseData['level$participantLevel'];
    // questionData = responseData['level1'];

    //questionData = responseData['level1'];

    // print(questionData);
    //  print(questionData.isEmpty);
    // questionData = [
    //   {
    //     "question_id": "8647d621-f28d-4eaf-858e-672dbb9dcc5d",
    //     "question_text": "what is c stands for",
    //     "choice1": "apple",
    //     "choice2": "ball",
    //     "choice3": "cat",
    //     "choice4": "dog",
    //     "correct_ans": "cat",
    //     "level": 1
    //   } ,
    //   {
    //     "question_id": "8647d621-f28d-4eaf-858e-672dbb9dcc5c",
    //     "question_text": "what is a stands for",
    //     "choice1": "apple",
    //     "choice2": "ball",
    //     "choice3": "cat",
    //     "choice4": "dog",
    //     "correct_ans": "apple",
    //     "level": 1
    //   }
    // ];
    // }
    if(questionData.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        message: "Could not fetch data",
      ));
    }
    // }
  }

  @override
  Future<void> onInit() async {
    // await getQuestions();
    WebAppReloadDetector.onReload(() {
      Get.offAllNamed(Routes.HOME);
    });
    super.onInit();
    //isLoading.value = true;
    pageController = PageController();
    pageController.addListener(() {
      isFinalQuestion.value = !(currentPageIndex < questionData.length - 1);
    });

    //selectedOptions = List<String>.filled(questionData.length, '');
    //print(questionData.length);
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.removeListener(() {});
    pageController.dispose();
    super.onClose();
  }

  void nextQuestion() async {
   // print("hellllllllllllo");
  // print("currentPageIndex: $currentPageIndex  questionData.length: ${questionData.length}");
    currentPageIndex++;
    pageController.addListener(() {
      isFinalQuestion.value = !(currentPageIndex < questionData.length -1 );
    });
   //print("currentPageIndex: $currentPageIndex  questionData.length: ${questionData.length}");
    if (currentPageIndex < questionData.length  ) {
   // print("if mein hun");
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    else if (currentPageIndex == questionData.length ) {
      // Get.toNamed(Routes.RESULTS_PAGE);
   //print("else mein hun");
      await getResults();
    }
  }

  Future<void> getResults() async {

    // var request = await http.MultipartRequest(
    //     'POST', Uri.parse('https://hackcbs-backend.onrender.com//score/$participantId'));
    // request.fields.addAll({'score': score.toString()});
    // http.StreamedResponse response = await request.send();
    //stringResponse = await response.stream.bytesToString();
   print( "yaha pe hun");
   print("https://hackcbs-backend.onrender.com/score/$participantId");
   print("{\"Score\": ${score.toStringAsFixed(8)},}");
    var request = await http.put(
      Uri.parse('https://hackcbs-backend.onrender.com/score/$participantId') ,
      body: {
        "Score": score.toStringAsFixed(8),
      },
    );
    print(participantId);
    print(request.statusCode);
    print("sdasdasd");
    print(json.decode(request.body));
    print("sdasdasd");
    if (request.statusCode == 201) {
      Timer(const Duration(seconds: 30), () async {
        final response = await http.post(Uri.parse("https://hackcbs-backend.onrender.com/winner/$matchId"),
            body: {}
        );

     print("matchid$matchId");
      Timer(const Duration(seconds: 30), () async {
        final prefs = await SharedPreferences.getInstance();
        final response = await http.get(Uri.parse("https://hackcbs-backend.onrender.com/winner/show/$matchId"));
        print("`````" + response.body);
        var responseData = json.decode(response.body);
        final levelResponse = await http.post(Uri.parse("https://hackcbs-backend.onrender.com/levels/$competitionId/${participantLevel + 1}") , body: {});
        var levelResponseData = json.decode(levelResponse.body);
        print(participantLevel);
        print(levelResponseData);
        print(response.statusCode);
        // print(username);
        print(responseData['username']);
        if(response.statusCode == 200) {
          if (responseData['username'] == prefs.getString('username_value')) {
            print(levelResponseData['next_level']);
            print(participantLevel);
            print(levelResponseData['next_level'] == false);
            if (levelResponseData['next_level'] == false) {
              isCompetitionWinner.value = true;
             print("1111111111");
             print(isCompetitionWinner.value);
              Get.toNamed(Routes.RESULTS_PAGE, arguments: {
                'winner': [responseData['username']],
              });
            }
            else {
            print("2222222222");
            print(isCompetitionWinner.value);
              Get.toNamed(Routes.RESULTS_PAGE, arguments: {
                'winner': [responseData['username']],
              });
            }
          }
          else{
          print("333333333333");
          print(isCompetitionWinner.value);
            Get.toNamed(Routes.RESULTS_PAGE, arguments: {
              'winner': [responseData['username']],
            });
          }
        }
      });
      });
    } else {
      if (request.body.contains('non_field_errors')) {
        Get.showSnackbar(const GetSnackBar(
          message: "Invalid Credentials",
        ));
      } else {
        Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 2),
          message: "No participant found for corresponding id !!!",
        ));
      }
    }


    // isCompetitionWinner.value = false;
    //   Get.toNamed(Routes.RESULTS_PAGE, arguments: {
    //     'winner': player.value,
    //   });
      
  }

  bool calcScore(int index, String selectedOption, DateTime dateTime) {
    if (selectedOption == questionData[index]["correct_ans"]) {
      DateTime dateTimeAfterEnd = DateTime.now();
      var difference1 = dateTimeAfterEnd.difference(dateTime);
      var difference2 = difference1.inMilliseconds + (dateTimeAfterEnd.millisecond - dateTime.millisecond).abs();
      var difference3 = difference2 / 1000;
      var difference4 = difference3 / 15;
      var difference5 = difference4 / 2;
      var difference6 = 1 - difference5;
      var difference7 = difference6 * 1000;
      // var difference7 = difference6 * 100000000;

      score = score + difference7;
      print(score);
      return true;
    } else {
      return false;
    }
  }

  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: start),
      const Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      current.value = start - duration.elapsed.inSeconds;
    });

    sub.onDone(() {
      isTimeOver.value = true;
      isOptionSelected.value = false;
      isAnswerCorrect.value = false;
      current.value = 15;
      sub.cancel();
    });
  }

  void startTimer1() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: start1),
      const Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      current1.value = start1 - duration.elapsed.inSeconds;
    });

    sub.onDone(() {
      // isTimeOver.value = true;
      // isOptionSelected.value = false;
      // isAnswerCorrect.value = false;
      current1.value = 60;
      sub.cancel();
    });
  }
}
