import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app_data.dart';
//import '../../login/views/login_view.dart';
import '../controllers/results_page_controller.dart';
//import '../../../routes/app_pages.dart';
//import 'package:flutter_svg/svg.dart';

class ResultsPageView extends GetView<ResultsPageController> {
  const ResultsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.startTimer();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Result'),
      // ),
      body:
     // Obx(() =>
      isCompetitionWinner.isFalse
          ? controller.argumentData['winner'][0] == player.value
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal : 8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Image(image: AssetImage('assets/images/round_winner.png') , height: 400, width: 400,),
                        const SizedBox(
                          height: 40,
                        ),
                         Text(
                          "You Won this round !!!",
                          textAlign: TextAlign.center,
                          style:
                          GoogleFonts.spaceMono(fontSize: 30, fontWeight: FontWeight.bold , color: Colors.green),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() => Text("LeaderBoard will be in ${controller.current} seconds",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spaceMono(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal : 8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Image(image: AssetImage('assets/images/loser.png') , height: 300, width: 300,),
                        const SizedBox(
                          height: 20,
                        ),
                       Text(
                          "Your Opponent Won this round !!!",
                          textAlign: TextAlign.center,
                          style:
                          GoogleFonts.spaceMono(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() => Text("LeaderBoard will be in ${controller.current} seconds",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spaceMono(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                      ],
                    ),
                  ),
                )
          :
       Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal : 8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ), Text(
                      "Winner, Winner, Quiz Master!!!",
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.spaceMono(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Image(image: AssetImage('assets/images/winner.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You Won this Competition !!!",
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.spaceMono(fontSize: 30, fontWeight: FontWeight.bold , color: Colors.green),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => Text("LeaderBoard will be in ${controller.current} seconds",
                        textAlign: TextAlign.center,
                        style:GoogleFonts.spaceMono(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                  ],
                ),
              ),
            ),
   // ),
    );
  }
}
