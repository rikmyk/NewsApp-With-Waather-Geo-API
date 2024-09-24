import 'package:berita/app/controllers/news_controller_controller.dart';
import 'package:berita/app/modules/Article/utils/search_widget.dart';
import 'package:berita/app/modules/new_details/views/new_details_view.dart';
import 'package:berita/app/views/views/newstile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    NewsControllerController newsController =
        Get.put(NewsControllerController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.all(10.0), // Tambahkan const untuk EdgeInsets
          child: ListView(
            children: [
              const Searchwidget(),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (newsController.newsForYouList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    children: newsController.newsForYouList.map((e) {
                      return NewstileView(
                        onTap: () {
                          Get.to(
                            NewDetailsView(
                              news: e,
                            ),
                          );
                        },
                        imageUrl: e.urlToImage ??
                            "https://i.pinimg.com/564x/04/21/4c/04214c0dfd5d98df4dc27946ce176ab8.jpg",
                        title: e.title ?? "No Title",
                        author: e.author ?? "Unknown",
                        time: e.publishedAt ?? "No Time",
                      );
                    }).toList(), // Hapus koma yang berlebihan di sini
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
