import 'package:berita/app/modules/new_details/views/new_details_view.dart';
import 'package:berita/app/modules/home/controllers/home_controller.dart';
import 'package:berita/components/news_tiles_loading_card.dart';
import 'package:berita/components/tranding_loading_card.dart';
import 'package:berita/utils/appbarnav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:berita/app/controllers/news_controller_controller.dart';
import 'package:berita/app/views/views/tranding_card_view.dart';
import 'package:berita/app/views/views/newstile_view.dart';

class HomeView extends GetView<HomeController> {
  final NewsControllerController newsController =
      Get.put(NewsControllerController());
  @override
  final HomeController controller = Get.put(HomeController());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return InkWell(
                      onTap: () {
                        controller.toggleTheme();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          controller.isDarkMode.value
                              ? Icons.dark_mode
                              : Icons.light_mode,
                        ),
                      ),
                    );
                  }),
                  const Appbarnav(),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hottest News',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Obx(
                () {
                  if (newsController.trandingNewsList.isEmpty) {
                    return const Center(
                      child: Trandingloadingcard(),
                    );
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: newsController.trandingNewsList.map(
                          (e) {
                            return TrandingCardView(
                              ontap: () {
                                Get.to(NewDetailsView(
                                  news: e,
                                ));
                              },
                              imageUrl: e.urlToImage ??
                                  'https://i.pinimg.com/564x/04/21/4c/04214c0dfd5d98df4dc27946ce176ab8.jpg',
                              title: e.title ?? 'No Title',
                              tags: "Tranding",
                              time: e.publishedAt ?? 'No Time',
                              author: e.author ?? "Unknow",
                            );
                          },
                        ).toList(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Politics News',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Obx(
                () {
                  if (newsController.indonesiaNewsList.isEmpty) {
                    return const Center(
                      child: Newstilesloadingcard(),
                    );
                  } else {
                    return Column(
                      children: newsController.indonesia5News
                          .map(
                            (e) => NewstileView(
                              onTap: () {
                                Get.to(NewDetailsView(news: e));
                              },
                              imageUrl: e.urlToImage ??
                                  'https://i.pinimg.com/564x/04/21/4c/04214c0dfd5d98df4dc27946ce176ab8.jpg',
                              title: e.title ?? "Unknow",
                              author: e.author ?? "Unknow",
                              time: e.publishedAt ?? "Unknow",
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Apple News',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Obx(
                () {
                  if (newsController.appleNewsList.isEmpty) {
                    return const Center(
                      child: Newstilesloadingcard(),
                    );
                  } else {
                    return Column(
                      children: newsController.apple5News
                          .map(
                            (e) => NewstileView(
                              onTap: () {
                                Get.to(NewDetailsView(news: e));
                              },
                              imageUrl: e.urlToImage ??
                                  "https://i.pinimg.com/564x/04/21/4c/04214c0dfd5d98df4dc27946ce176ab8.jpg",
                              title: e.title ?? "Unknow",
                              author: e.author ?? "Unknow",
                              time: e.publishedAt ?? "Unknow",
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sports News',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Obx(
                () {
                  if (newsController.newsForYouList.isEmpty) {
                    return const Center(
                      child: Newstilesloadingcard(),
                    );
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: newsController.newsForYouList.map(
                          (e) {
                            return TrandingCardView(
                              ontap: () {
                                Get.to(NewDetailsView(
                                  news: e,
                                ));
                              },
                              imageUrl: e.urlToImage ??
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_BlCXbILvBYiyJfi7FyHoFF1X2vSswrayYg&s',
                              title: e.title ?? 'No Title',
                              tags: "Street Journa",
                              time: e.publishedAt ?? 'No Time',
                              author: e.author ?? "Unknown",
                            );
                          },
                        ).toList(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Country News',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Obx(
                () {
                  if (newsController.teslaNewsList.isEmpty) {
                    return const Center(
                      child: Trandingloadingcard(),
                    );
                  } else {
                    return Column(
                      children: newsController.tesla5News
                          .map(
                            (e) => NewstileView(
                              onTap: () {
                                Get.to(NewDetailsView(news: e));
                              },
                              imageUrl: e.urlToImage ??
                                  "https://i.pinimg.com/564x/04/21/4c/04214c0dfd5d98df4dc27946ce176ab8.jpg",
                              title: e.title ?? "Unknow",
                              author: e.author ?? "Unknow",
                              time: e.publishedAt ?? "Unknow",
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
