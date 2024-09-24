import 'package:get/get.dart';

import '../controllers/new_details_controller.dart';

class NewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewDetailsController>(
      () => NewDetailsController(),
    );
  }
}
