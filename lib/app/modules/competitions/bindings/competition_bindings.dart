import 'package:get/get.dart';

import '../controllers/competition_controller.dart';

class CompetitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompetitionController>(
          () => CompetitionController(),
    );
  }
}
