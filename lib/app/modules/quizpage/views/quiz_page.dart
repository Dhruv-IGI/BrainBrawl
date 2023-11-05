import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/quizpage_controller.dart';
import '../../../../app_data.dart';

class QuizPage extends StatefulWidget {
  QuizPage({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  final QuizpageController controller = Get.find();
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    widget.controller.startTimer();
    DateTime dateTime = DateTime.now();
    // widget.controller.startTimer1();
    final String question = questionData[widget.index]["question_text"];
    // final int noOfOptions = questionData[widget.index]["answer_choices"].length;
    int noOfOptions = questionData[widget.index].length - 4;

    // final options = question['options'] as Map<String, dynamic>;

    // return Padding(
    //   padding: EdgeInsets.symmetric(horizontal: Get.width / 4, vertical: 20),
    //   child: Container(
    //     decoration:
    //         BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
    //       BoxShadow(
    //         color: Colors.grey.withOpacity(0.5),
    //         spreadRadius: 2,
    //         blurRadius: 4,
    //         offset: const Offset(0, 2),
    //       ),
    //     ]),
    //     padding: EdgeInsets.all(30),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text(
    //           question['question'],
    //           style: const TextStyle(
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.white),
    //           textAlign: TextAlign.center,
    //         ),
    //         const SizedBox(height: 20),
    //         // Column(
    //         //   children: options.entries
    //         //       .map(
    //         //         (option) => RadioListTile<String>(
    //         //             title: Text(option.value,
    //         //                 style: const TextStyle(
    //         //                     fontSize: 20,
    //         //                     fontWeight: FontWeight.bold,
    //         //                     color: Colors.white)),
    //         //             value: option.key,
    //         //             groupValue:
    //         //                 widget.controller.selectedOptions[widget.index],
    //         //             onChanged: (value) {
    //         //               setState(() {
    //         //                 widget.controller.selectOption(value!);
    //         //               });
    //         //             }),
    //         //       )
    //         //       .toList(),
    //         // ),
    //         const SizedBox(
    //           height: 50,
    //         ),
    //         Text(
    //           "${widget.index}/${questionData.length}",
    //           style: const TextStyle(
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.white),
    //           textAlign: TextAlign.center,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return MediaQuery.of(context).size.width < 600
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
            child: Container(
              decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.8),
                  //     spreadRadius: 2,
                  //     blurRadius: 4,
                  //     offset: const Offset(0, 2),
                  //   ),
                  // ],
                  image: DecorationImage(
                image: AssetImage("assets/images/ques_rect.png"),
                fit: BoxFit.fill,
              )),
              padding: const EdgeInsets.all(20),
              child: Obx(() {
                if (widget.controller.isTimeOver.isTrue) {
                  //print("Time Over");
                  widget.controller.nextQuestion();
                  widget.controller.current.value = 15;
                  widget.controller.current1.value = 60;
                  widget.controller.isTimeOver.value = false;
                  widget.controller.startTimer1();
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "DO NOT RELOAD THE PAGE",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 34),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Quiz Completed",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CircularProgressIndicator(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Getting Results... Please Wait",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => Text(
                          "Results in ${widget.controller.current1} seconds",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                      )
                    ],
                  ));
                } else {
                  return widget.controller.isOptionSelected.isFalse
                      ? Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  question,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                ListView.builder(
                                    //padding: const EdgeInsets.symmetric(horizontal: 400),
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount: noOfOptions,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        color: Colors.white,
                                        child: InkWell(
                                          onTap: () {
                                            widget.controller.isAnswerCorrect
                                                    .value =
                                                widget.controller.calcScore(
                                                    widget.index,
                                                    questionData[widget.index][
                                                            "choice${index + 1}"]
                                                        .toString(),
                                                    dateTime);
                                            widget.controller.isOptionSelected
                                                .value = true;
                                            // Timer(Duration(seconds: widget.controller.current.value - 1), () {
                                            //   widget.controller.isOptionSelected.value =
                                            //       false;
                                            //   widget.controller.isAnswerCorrect.value =
                                            //       false;
                                            //   widget.controller.current.value = 30;
                                            //   // widget.controller.isTimeOver.value = false;
                                            //   // widget.controller.nextQuestion();
                                            // });
                                          },
                                          child: SizedBox(
                                            // height: 300,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      questionData[widget.index]
                                                              [
                                                              "choice${index + 1}"]
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                const SizedBox(
                                  height: 50,
                                ),
                                Obx(
                                  () => Text(
                                    "Time left :- ${widget.controller.current} seconds",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${widget.index + 1}/${questionData.length}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      : widget.controller.isAnswerCorrect.isTrue
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Correct Answer ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Icon(
                                        Icons.new_releases,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  widget.index == questionData.length - 1
                                      ? Column(
                                          children: [
                                            const Text(
                                              "Quiz Completed",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const CircularProgressIndicator(),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Obx(
                                              () => Text(
                                                "Please wait for your opponent to answer... ${widget.controller.current} seconds",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            )
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            const CircularProgressIndicator(),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            // Obx(() => Text(
                                            //   "Time left :- ${widget.controller.current} seconds",
                                            //   style: const TextStyle(color: Colors.white, fontSize: 20),
                                            // ),),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Obx(
                                              () => Text(
                                                "Next Question in ${widget.controller.current} seconds",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            )
                                          ],
                                        ),
                                ],
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Wrong Answer ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Icon(
                                        Icons.report,
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  widget.index == questionData.length - 1
                                      ? Column(
                                          children: [
                                            const Text(
                                              "Quiz Completed",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const CircularProgressIndicator(),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Obx(
                                              () => Text(
                                                "Please wait for your opponent to answer... ${widget.controller.current} seconds",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            )
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            const CircularProgressIndicator(),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Obx(
                                              () => Text(
                                                "Next Question in ${widget.controller.current} seconds",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            )
                                          ],
                                        ),
                                ],
                              ),
                            );
                }
              }),
            ))
        : Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Get.width / 6, vertical: 2.h),
            child: Container(
              decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5),
                  //     spreadRadius: 2,
                  //     blurRadius: 4,
                  //     offset: const Offset(0, 2),
                  //   ),
                  // ]
                  image: DecorationImage(
                image: AssetImage("assets/images/ques_rect.png"),
                fit: BoxFit.fill,
              )),
              padding: const EdgeInsets.all(30),
              child: Obx(() {
                if (widget.controller.isTimeOver.isTrue) {
                  //print("Time Over");
                  widget.controller.nextQuestion();
                  widget.controller.current.value = 15;
                  widget.controller.isTimeOver.value = false;
                  widget.controller.startTimer1();
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "DO NOT REFRESH THE PAGE",
                        style: TextStyle(color: Colors.white, fontSize: 34),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Quiz Completed",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CircularProgressIndicator(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Getting Results... Please Wait",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => Text(
                          "Results in ${widget.controller.current1} seconds",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                      )
                    ],
                  ));
                } else {
                  return widget.controller.isOptionSelected.isFalse
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              question,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            ListView.builder(
                                //padding: const EdgeInsets.symmetric(horizontal: 400),
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: noOfOptions,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: Colors.white,
                                    child: InkWell(
                                      onTap: () {
                                        widget.controller.isAnswerCorrect
                                                .value =
                                            widget.controller.calcScore(
                                                widget.index,
                                                questionData[widget.index]
                                                        ["choice${index + 1}"]
                                                    .toString(),
                                                dateTime);
                                        widget.controller.isOptionSelected
                                            .value = true;
                                        // Timer(Duration(seconds: widget.controller.current.value - 1), () {
                                        //   widget.controller.isOptionSelected.value =
                                        //       false;
                                        //   widget.controller.isAnswerCorrect.value =
                                        //       false;
                                        //   widget.controller.current.value = 30;
                                        //   // widget.controller.isTimeOver.value = false;
                                        //   // widget.controller.nextQuestion();
                                        // });
                                      },
                                      child: SizedBox(
                                        height: 70,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                questionData[widget.index]
                                                        ["choice${index + 1}"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height: 50,
                            ),
                            Obx(
                              () => Text(
                                "Time left :- ${widget.controller.current} seconds",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${widget.index + 1}/${questionData.length}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : widget.controller.isAnswerCorrect.isTrue
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Correct Answer ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Icon(
                                        Icons.new_releases,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  widget.index == questionData.length - 1
                                      ? Column(
                                          children: [
                                            const Text(
                                              "Quiz Completed",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const CircularProgressIndicator(),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Obx(
                                              () => Text(
                                                "Please wait for your opponent to answer... ${widget.controller.current} seconds",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            )
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            const CircularProgressIndicator(),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            // Obx(() => Text(
                                            //   "Time left :- ${widget.controller.current} seconds",
                                            //   style: const TextStyle(color: Colors.white, fontSize: 20),
                                            // ),),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Obx(
                                              () => Text(
                                                "Next Question in ${widget.controller.current} seconds",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            )
                                          ],
                                        ),
                                ],
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Wrong Answer ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Icon(
                                        Icons.report,
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  widget.index == questionData.length - 1
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Quiz Completed",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const CircularProgressIndicator(),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Obx(
                                              () => Text(
                                                "Please wait for your opponent to answer... ${widget.controller.current} seconds",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            )
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            const CircularProgressIndicator(),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Obx(
                                              () => Text(
                                                "Next Question in ${widget.controller.current} seconds",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            )
                                          ],
                                        ),
                                ],
                              ),
                            );
                }
              }),
            ));
  }
}
