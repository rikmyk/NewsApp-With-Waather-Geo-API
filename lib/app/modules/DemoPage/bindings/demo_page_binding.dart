import 'package:get/get.dart';

import '../controllers/demo_page_controller.dart';

class DemoPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoPageController>(
      () => DemoPageController(),
    );
  }
}
