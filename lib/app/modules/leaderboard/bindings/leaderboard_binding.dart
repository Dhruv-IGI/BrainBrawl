import 'package:get/get.dart';

import '../controllers/leaderboard_controller.dart';

class LeaderBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LeaderBoardController>(
      LeaderBoardController(),
    );
  }
}
