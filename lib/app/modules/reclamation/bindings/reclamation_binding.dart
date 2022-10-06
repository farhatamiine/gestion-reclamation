import 'package:get/get.dart';

import '../controllers/reclamation_controller.dart';

class ReclamationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReclamationController>(
      () => ReclamationController(),
    );
  }
}
