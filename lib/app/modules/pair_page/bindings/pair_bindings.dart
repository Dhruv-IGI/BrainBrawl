import 'package:get/get.dart';

import '../controllers/pair_controller.dart';

class PairBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PairController>(
          () => PairController(),
    );
  }
}
