import 'package:get/get.dart';

import '../../models/news_model/news_model.dart';
import '../modules/Article/bindings/article_binding.dart';
import '../modules/Article/views/article_view.dart';
import '../modules/DemoPage/bindings/demo_page_binding.dart';
import '../modules/DemoPage/views/demo_page_view.dart';
import '../modules/new_details/bindings/new_details_binding.dart';
import '../modules/new_details/views/new_details_view.dart';
import '../modules/Profile/bindings/profile_binding.dart';
import '../modules/Profile/views/profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.article,
      page: () => const ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.newDetails,
      page: () => NewDetailsView(
        news: NewsModel(),
      ),
      binding: NewDetailsBinding(),
    ),
    GetPage(
      name: _Paths.demoPage,
      page: () => const DemoPageView(),
      binding: DemoPageBinding(),
    ),
  ];
}
