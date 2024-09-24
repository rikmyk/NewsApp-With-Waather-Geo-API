import 'package:berita/config/theme.dart';
import 'package:berita/app/modules/controllers/home_page_controllers.dart';
// import 'package:berita/app/modules/DemoPage/views/demo_page_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      // initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,  
      home: const Homepagecontrollers(),
      // home: DemoPageView(),
    ),
  );
}
