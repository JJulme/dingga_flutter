import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class HomeScreen extends GetResponsiveView {
  HomeScreen({super.key});

  @override
  Widget phone() {
    return Builder(
      builder: (context) {
        // MediaQuery를 사용하여 화면 너비와 높이를 가져옵니다.
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        // 대각선 크기 계산
        double diagonal =
            sqrt(screenWidth * screenWidth + screenHeight * screenHeight);
        return Scaffold(
          appBar: homeAppbar(diagonal),
          body: Column(
            children: [
              mainText("놀러갈 장소들의 정보를 비교해 보세요!", diagonal),
              playtypeBtnPhone(
                playtype: "/Themepark",
                text: "놀이공원",
                img: "assets/images/themepark_background2_phone.jpg",
                textSize: 0.055 * diagonal,
                width: 0.35 * diagonal,
                margin: 0.03 * diagonal,
              ),
              playtypeBtnPhone(
                playtype: "/Zoo",
                text: "동물원",
                img: "assets/images/zoo_background_phone.jpg",
                textSize: 0.055 * diagonal,
                width: 0.35 * diagonal,
                margin: 0.03 * diagonal,
              ),
              playtypeBtnPhone(
                playtype: "/Aquarium",
                text: "아쿠아리움",
                img: "assets/images/aquarium_background_phone.jpg",
                textSize: 0.055 * diagonal,
                width: 0.35 * diagonal,
                margin: 0.03 * diagonal,
              ),
              playtypeBtnPhone(
                playtype: "/Ski",
                text: "스키장",
                img: "assets/images/ski_background.jpg",
                textSize: 0.055 * diagonal,
                width: 0.35 * diagonal,
                margin: 0.03 * diagonal,
              ),
              Container(
                height: 0.05 * diagonal,
                color: Colors.white,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget tablet() {
    return Builder(
      builder: (context) {
        // MediaQuery를 사용하여 화면 너비와 높이를 가져옵니다.
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        // 대각선 크기 계산
        double diagonal =
            sqrt(screenWidth * screenWidth + screenHeight * screenHeight);
        return Scaffold(
          appBar: homeAppbar(diagonal),
          body: Column(
            children: [
              mainText("전국의 놀이공원, 동물원, 아쿠아리움, 스키장의 정보를 비교해 보세요!", diagonal),
              Flexible(
                child: Row(
                  children: [
                    playtypeBtnPhone(
                      playtype: "/Themepark",
                      text: "놀이공원",
                      img: "assets/images/themepark_background2_phone.jpg",
                      textSize: 0.055 * diagonal,
                      width: 0.25 * diagonal,
                      margin: 0.035 * diagonal,
                    ),
                    playtypeBtnPhone(
                      playtype: "/Zoo",
                      text: "동물원",
                      img: "assets/images/zoo_background.jpg",
                      textSize: 0.055 * diagonal,
                      width: 0.25 * diagonal,
                      margin: 0.035 * diagonal,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    playtypeBtnPhone(
                      playtype: "/Aquarium",
                      text: "아쿠아리움",
                      img: "assets/images/aquarium_background.jpg",
                      textSize: 0.055 * diagonal,
                      width: 0.25 * diagonal,
                      margin: 0.035 * diagonal,
                    ),
                    playtypeBtnPhone(
                      playtype: "/Ski",
                      text: "스키장",
                      img: "assets/images/ski_background.jpg",
                      textSize: 0.055 * diagonal,
                      width: 0.25 * diagonal,
                      margin: 0.035 * diagonal,
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.05 * diagonal,
                color: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget desktop() {
    return Builder(
      builder: (context) {
        // MediaQuery를 사용하여 화면 너비와 높이를 가져옵니다.
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        // 대각선 크기 계산
        double diagonal =
            sqrt(screenWidth * screenWidth + screenHeight * screenHeight);
        return Scaffold(
          appBar: homeAppbar(0.75 * diagonal),
          body: Column(
            children: [
              mainText(
                  "전국의 놀이공원, 동물원, 아쿠아리움, 스키장의 정보를 비교해 보세요!", 0.75 * diagonal),
              Expanded(
                child: Row(
                  children: [
                    playtypeBtnPhone(
                      playtype: "/Themepark",
                      text: "놀이공원",
                      img: "assets/images/themepark_background2.jpg",
                      textSize: 0.045 * diagonal,
                      width: double.infinity,
                      margin: 0.1 * diagonal,
                    ),
                    playtypeBtnPhone(
                      playtype: "Zoo",
                      text: "동물원",
                      img: "assets/images/zoo_background.jpg",
                      textSize: 0.045 * diagonal,
                      width: double.infinity,
                      margin: 0.1 * diagonal,
                    ),
                    playtypeBtnPhone(
                      playtype: "/Aquarium",
                      text: "아쿠아리움",
                      img: "assets/images/aquarium_background.jpg",
                      textSize: 0.045 * diagonal,
                      width: double.infinity,
                      margin: 0.1 * diagonal,
                    ),
                    playtypeBtnPhone(
                      playtype: "/Ski",
                      text: "스키장",
                      img: "assets/images/ski_background.jpg",
                      textSize: 0.045 * diagonal,
                      width: double.infinity,
                      margin: 0.1 * diagonal,
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.05 * diagonal,
                color: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }

  // 앱바
  AppBar homeAppbar(double di) {
    return AppBar(
      //뒤로가기 버튼 없애기
      automaticallyImplyLeading: false,
      //배경화면 흰색 설정
      backgroundColor: Colors.white,
      // 앱바 밑 그림자
      title: SizedBox(
        height: 0.05 * di,
        width: 0.12 * di,
        child: InkWell(
          onTap: () => Get.offAll(() => HomeScreen()),
          child: Image.asset("assets/images/dingga_logo2.png"),
        ),
      ),
      actions: [
        Row(
          children: [
            Icon(
              Icons.email_rounded,
              color: Colors.grey[400],
            ),
            Text(
              " dingga822@naver.com",
              style: TextStyle(color: Colors.grey[400], fontSize: 0.015 * di),
            ),
            SizedBox(width: 0.01 * di),
          ],
        )
      ],
    );
  }

  // 앱바 밑에 안내 문구
  Container mainText(txt, double di) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(0.02 * di),
      color: Colors.white,
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 0.023 * di,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  // 놀러갈 장소 버튼
  Flexible playtypeBtnPhone({
    required String playtype,
    required String text,
    required String img,
    required double textSize,
    required double width,
    required double margin,
  }) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: () => Get.toNamed(playtype),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: margin),
              height: double.infinity,
              width: width,
              color: Colors.amber.withOpacity(0.5),
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(fontSize: textSize, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
