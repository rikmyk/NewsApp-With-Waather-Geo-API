import 'package:get/get.dart';

class ArticleController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
