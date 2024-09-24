import 'package:berita/app/modules/Article/views/article_view.dart';
import 'package:berita/app/modules/Profile/views/profile_view.dart';
import 'package:berita/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

class Bottomnavcontroller extends GetxController {
  RxInt index = 0.obs;

  var pages = [HomeView(), const ArticleView(), const ProfileView()];
}
