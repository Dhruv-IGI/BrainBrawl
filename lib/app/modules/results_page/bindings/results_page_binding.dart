import 'package:get/get.dart';

import '../controllers/results_page_controller.dart';

class ResultsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ResultsPageController>(
       ResultsPageController(),
    );
  }
}
