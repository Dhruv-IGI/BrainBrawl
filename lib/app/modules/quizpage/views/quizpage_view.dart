import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brainbrawl/app/modules/quizpage/views/quiz_page.dart';
import '../controllers/quizpage_controller.dart';
import '../../../../app_data.dart';

class QuizpageView extends GetView<QuizpageController> {
  const QuizpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.isTrue
            ? const SizedBox(
                height: 100,
                child: Center(child: CircularProgressIndicator()),
              )
            : Stack(
                children: [
                  Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    // decoration: const BoxDecoration(
                    //   image: DecorationImage(
                    //     image: ExactAssetImage("assets/images/virtual.jpg"),
                    //     fit: BoxFit.fill,
                    //     alignment: Alignment.center,
                    //   ),
                    // ),
                  ),
                  Wrap(
                    children: [
                      SizedBox(
                        height: Get.height,
                        child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller.pageController,
                          itemCount: questionData.length,
                          itemBuilder: (context, index) {
                            return QuizPage(index: index);
                          },
                        ),
                      ),
                      // const SizedBox(height: 16),
                      // const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
