import 'package:berita/app/controllers/news_controller_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searchwidget extends StatelessWidget {
  const Searchwidget({super.key});

  @override
  Widget build(BuildContext context) {
    NewsControllerController newsController =
        Get.put(NewsControllerController());
    TextEditingController searchController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search Article ...",
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                border: InputBorder.none,
              ),
            ),
          ),
          Obx(
            () {
              // Anda mungkin ingin menampilkan indikator loading di sini.
              if (newsController.isSearchNewsLoad.value) {
                return Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else {
                return InkWell(
                  onTap: () {
                    newsController.searchNews(searchController.text);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Icon(Icons.search),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
