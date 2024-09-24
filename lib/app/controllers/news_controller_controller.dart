import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:berita/models/news_model/news_model.dart';

class NewsControllerController extends GetxController {
  RxList<NewsModel> trandingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> indonesiaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> indonesia5News = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> tesla5News = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> apple5News = <NewsModel>[].obs;

  // loading
  RxBool isSearchNewsLoad = false.obs;
  var searchResults = [].obs;

  @override
  void onInit() async {
    super.onInit();
    getTrendingNews();
    getForYou();
    getIndonesiaNews();
    getTeslaNews();
    getAppleNews();
  }

  Future<void> getTrendingNews() async {
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=9ec25b6a842c4898bca10d2c5fcb3b96";
    var response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var articles = body["articles"];

      if (articles != null) {
        trandingNewsList.clear();
        articles.forEach((article) {
          trandingNewsList.add(NewsModel.fromJson(article));
        });
      }
    } else {}
  }

  Future<void> getForYou() async {
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?q=sports&apiKey=9ec25b6a842c4898bca10d2c5fcb3b96";
    var response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var articles = body["articles"];

      if (articles != null) {
        newsForYouList.clear();
        articles.forEach((article) {
          newsForYouList.add(NewsModel.fromJson(article));
        });

        // Update newForYou5 with the first 5 elements of newForYouList
        if (newsForYouList.length >= 5) {
          newsForYou5.value = newsForYouList.sublist(0, 5);
        } else {
          newsForYou5.value = newsForYouList;
        }
      }
    } else {}
  }

  Future<void> getIndonesiaNews() async {
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?q=politics&apiKey=9ec25b6a842c4898bca10d2c5fcb3b96";
    var response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var articles = body["articles"];

      if (articles != null) {
        indonesiaNewsList.clear();
        articles.forEach((article) {
          indonesiaNewsList.add(NewsModel.fromJson(article));
        });

        // Update newForYou5 with the first 5 elements of newForYouList
        if (indonesiaNewsList.length >= 5) {
          indonesia5News.value = indonesiaNewsList.sublist(0, 5);
        } else {
          indonesia5News.value = indonesiaNewsList;
        }
      }
    } else {}
  }

  Future<void> getTeslaNews() async {
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?q=country&apiKey=9ec25b6a842c4898bca10d2c5fcb3b96";
    var response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var articles = body["articles"];

      if (articles != null) {
        teslaNewsList.clear();
        articles.forEach((article) {
          teslaNewsList.add(NewsModel.fromJson(article));
        });

        // Update newForYou5 with the first 5 elements of newForYouList
        if (teslaNewsList.length >= 5) {
          tesla5News.value = teslaNewsList.sublist(0, 5);
        } else {
          tesla5News.value = teslaNewsList;
        }
      }
    } else {}
  }

  Future<void> getAppleNews() async {
    var baseUrl =
        "https://newsapi.org/v2/everything?q=apple&from=2024-09-01&to=2024-09-01&sortBy=popularity&apiKey=9ec25b6a842c4898bca10d2c5fcb3b96";
    var response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var articles = body["articles"];

      if (articles != null) {
        appleNewsList.clear();
        articles.forEach((article) {
          appleNewsList.add(NewsModel.fromJson(article));
        });

        // Update newForYou5 with the first 5 elements of newForYouList
        if (appleNewsList.length >= 5) {
          apple5News.value = appleNewsList.sublist(0, 5);
        } else {
          apple5News.value = appleNewsList;
        }
      }
    } else {}
  }

  Future<void> searchNews(String search) async {
    isSearchNewsLoad.value = true;
    var baseURL =
        "https://newsapi.org/v2/top-headlines?q=$search&apiKey=9ec25b6a842c4898bca10d2c5fcb3b96";
    {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        newsForYouList.clear();
        int i = 0;
        for (var news in articals) {
          i++;
          newsForYouList.add(NewsModel.fromJson(news));
          if (i == 10) {
            break;
          }
        }
      } else {}
    }
    isSearchNewsLoad.value = false;
  }
}
