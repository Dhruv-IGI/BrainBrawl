import 'package:get/get.dart';

import '../controllers/quizpage_controller.dart';

class QuizpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizpageController>(
      () => QuizpageController(),
    );
    // Get.put<QuizpageController>(
    //     QuizpageController(),
    // );
  }
}
