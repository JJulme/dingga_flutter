// flutter run -d chrome --web-port=8080
// flutter run -d chrome --web-port=8080 --web-renderer html

import 'dart:ui';

import 'package:dingga/screen/aquarium_screen.dart';
import 'package:dingga/screen/home_screen.dart';
import 'package:dingga/screen/ski_screen.dart';
import 'package:dingga/screen/themepark_screen.dart';
import 'package:dingga/screen/zoo_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // 화면 가로 스크롤을 위한 설정 - custum_class.dart에서 가져옴
        scrollBehavior: MyCustumScrollBehavior(),
        theme: ThemeData(
          // 기본 배경 색상 설정
          scaffoldBackgroundColor: Colors.white70,
          primarySwatch: Colors.amber,
          // 글씨체 적용
          fontFamily: "Cafe24Supermagic",
        ),
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => HomeScreen()),
          GetPage(name: "/Aquarium", page: () => AquariumScreen()),
          GetPage(name: "/Ski", page: () => SkiScreen()),
          GetPage(name: "/Themepark", page: () => ThemeparkScreen()),
          GetPage(name: "/Zoo", page: () => ZooScreen()),
        ]);
  }
}

// 웹에서 가로 스크롤이 가능하도록 해주는 클래스
class MyCustumScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus
      };
}
