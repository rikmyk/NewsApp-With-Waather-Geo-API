// import 'package:berita/components/loading_container.dart';
import 'package:berita/utils/appbarnav.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/demo_page_controller.dart';

class DemoPageView extends GetView<DemoPageController> {
  const DemoPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(Icons.dark_mode),
                  ),
                );
              }),
              const Appbarnav(),
            ],
          ),
        ],
      )),
    );
  }
}
