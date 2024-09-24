import 'package:berita/app/modules/home/controllers/bottom_nav_controller.dart';
import 'package:berita/utils/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepagecontrollers extends StatelessWidget {
  const Homepagecontrollers({super.key});

  @override
  Widget build(BuildContext context) {
    Bottomnavcontroller controller = Get.put(Bottomnavcontroller());
    return Scaffold(
      floatingActionButton: const MybotNav(),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
