import 'package:berita/app/modules/home/controllers/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MybotNav extends StatelessWidget {
  const MybotNav({super.key});

  @override
  Widget build(BuildContext context) {
    Bottomnavcontroller controller = Get.put(Bottomnavcontroller());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.index.value = 0;
                      },
                      child: Obx(
                        () => AnimatedContainer(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.bounceInOut,
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: controller.index.value == 0
                                ? Theme.of(context).colorScheme.primary
                                : null,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.home,
                            size: 25,
                            color: controller.index.value == 0
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          controller.index.value = 1;
                        },
                        child: Obx(
                          () => AnimatedContainer(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.bounceInOut,
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: controller.index.value == 1
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              Icons.book,
                              size: 25,
                              color: controller.index.value == 1
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                            ),
                          ),
                        )),
                    InkWell(
                        onTap: () {
                          controller.index.value = 2;
                        },
                        child: Obx(
                          () => AnimatedContainer(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.bounceInOut,
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: controller.index.value == 2
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              Icons.priority_high_rounded,
                              size: 25,
                              color: controller.index.value == 2
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
