import 'dart:async';
import 'dart:convert';
//import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:brainbrawl/app/modules/login/views/login_view.dart';
import '../../../routes/app_pages.dart';
//import '../../login/views/login_view.dart';
import 'package:http/http.dart' as http;
//import '../../login/controllers/login_controller.dart';
import '../../../../app_data.dart';


class PairController extends GetxController {
  RxBool isLoading = true.obs;
  late String stringResponse;


  @override
  void onInit() {
    //round++;
    WebAppReloadDetector.onReload(() {
      Get.offAllNamed(Routes.HOME);
    });
    participantLevel++;
    getTotalRound();
    Timer (
      const Duration(seconds: 7),
          () {
           getUserpair();
           isLoading.value = false;
          },
    );
    super.onInit();
  }

  void change() {
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void getTotalRound() async {
    // final prefs = await SharedPreferences.getInstance();
    // accessToken = prefs.getString('access_token_value')!;
    // print(accessToken);
    print("https://hackcbs-backend.onrender.com/levels/$competitionId/$participantLevel");
    final levelResponse = await http.post(Uri.parse("https://hackcbs-backend.onrender.com/levels/$competitionId/$participantLevel") , body: {});
    print(levelResponse.statusCode);
    if (levelResponse.statusCode == 201) {
      final json = await jsonDecode(levelResponse.body);
      print(json);
      // print(json['level']);
      // print(json['level']['round']);
      if(json['total_level'] == 1) {
        round.value = "Final Round";
      }
      else if (json['total_level'] == 2)
        {
          round.value = "Semi-Final Round";
        }
      else {
      round.value = "Round ${json['total_level']}";
      }
      // print(round);
    }
    else {
      Get.showSnackbar(const GetSnackBar(
        message: "Could not fetch data",
        duration: Duration(seconds: 5),
      ));
    }
  }




  void getUserpair() async {
    final prefs = await SharedPreferences.getInstance();
    // if(participantLevel == 0) {

    //participantLevel++;

    // } else {
    //   participantLevel = participantLevel + 2;
    // }
    var response = await http.post(Uri.parse('https://hackcbs-backend.onrender.com/pair/$participantLevel') , body: {});
    response = await http.get(Uri.parse('https://hackcbs-backend.onrender.com/pair/$participantLevel'));
    if (response.statusCode == 200) {
    final json = await jsonDecode(response.body);
      int playerIndex=0;
      for(;playerIndex < json['pair'].length;playerIndex++) {
        if (json['pair'][playerIndex]['player'] ==  prefs.getString('username_value')) {
          break;
        }
      }
      player.value = json['pair'][playerIndex]['player'];
      opponent.value = json['pair'][playerIndex]['opponent'];
      matchId = json['pair'][playerIndex]['match_id'];
      // print(json);
      // print(player.value);
      // print(opponent.value);
      // print(matchId);
      // print(participantLevel);
      //TODO: MAKE A LEVEL VARIABLE
      isLoading.value = false;
      getQuestions();
      Timer(
          const Duration(seconds: 5 ) ,
              () => Get.toNamed(Routes.QUIZPAGE));
      onClose();
    }
    else {
      Get.showSnackbar(const GetSnackBar(
        message: "Could not fetch data",
        duration: Duration(seconds: 5),
      ));
      getQuestions();
      Timer(
          const Duration(seconds: 5 ) ,
              () => Get.toNamed(Routes.QUIZPAGE));
    }
  }

  void getQuestions() async {
    // final response = await http.get(Uri.parse("https://hackcbs-backend.onrender.com//questions/$participantLevel"));   //TODO: add level to link
    // if (response.statusCode == 200) {
    //   questionData = json.decode(response.body);
    final response = await rootBundle.loadString('assets/json/abc.json');
   // print(response);
    var responseData = json.decode(response);
  //  print(responseData);


    questionData = responseData['level$participantLevel'];

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
}