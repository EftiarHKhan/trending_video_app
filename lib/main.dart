import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trending_video_app/controller/home_controller.dart';
import 'package:trending_video_app/pages/home_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController mvc = Get.put(HomeController());
    return GetMaterialApp(
      title: 'Trending Video app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

// for non SSL http request
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
