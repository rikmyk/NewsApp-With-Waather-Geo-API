import 'package:get/get.dart';

class DemoPageController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
