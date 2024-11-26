import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetResponsiveView {
  HomeScreen({super.key});

  @override
  Widget phone() {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: homeAppbar(),
          body: Column(
            children: [
              mainText("놀러갈 장소들의 정보를 비교해 보세요!"),
              playtypeBtnPhone(
                playtype: "/Themepark",
                text: "놀이공원",
                img: "assets/images/themepark_background2_phone.jpg",
                width: 300,
                margin: 35,
              ),
              playtypeBtnPhone(
                playtype: "/Zoo",
                text: "동물원",
                img: "assets/images/zoo_background_phone.jpg",
                width: 300,
                margin: 35,
              ),
              playtypeBtnPhone(
                playtype: "/Aquarium",
                text: "아쿠아리움",
                img: "assets/images/aquarium_background_phone.jpg",
                width: 300,
                margin: 35,
              ),
              playtypeBtnPhone(
                playtype: "/Ski",
                text: "스키장",
                img: "assets/images/ski_background.jpg",
                width: 300,
                margin: 35,
              ),
              Container(
                height: 30,
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
        return Scaffold(
          appBar: homeAppbar(),
          body: Column(
            children: [
              mainText("전국의 놀이공원, 동물원, 아쿠아리움, 스키장의 정보를 비교해 보세요!"),
              Flexible(
                child: Row(
                  children: [
                    playtypeBtnPhone(
                      playtype: "/Themepark",
                      text: "놀이공원",
                      img: "assets/images/themepark_background2_phone.jpg",
                      width: 280,
                      margin: 50,
                    ),
                    playtypeBtnPhone(
                      playtype: "/Zoo",
                      text: "동물원",
                      img: "assets/images/zoo_background.jpg",
                      width: 280,
                      margin: 50,
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
                      width: 280,
                      margin: 50,
                    ),
                    playtypeBtnPhone(
                      playtype: "/Ski",
                      text: "스키장",
                      img: "assets/images/ski_background.jpg",
                      width: 280,
                      margin: 50,
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
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
        return Scaffold(
          appBar: homeAppbar(),
          body: Column(
            children: [
              mainText("전국의 놀이공원, 동물원, 아쿠아리움, 스키장의 정보를 비교해 보세요!"),
              Expanded(
                child: Row(
                  children: [
                    playtypeBtnPhone(
                      playtype: "/Themepark",
                      text: "놀이공원",
                      img: "assets/images/themepark_background2.jpg",
                      width: double.infinity,
                      margin: 220,
                    ),
                    playtypeBtnPhone(
                      playtype: "Zoo",
                      text: "동물원",
                      img: "assets/images/zoo_background.jpg",
                      width: double.infinity,
                      margin: 220,
                    ),
                    playtypeBtnPhone(
                      playtype: "/Aquarium",
                      text: "아쿠아리움",
                      img: "assets/images/aquarium_background.jpg",
                      width: double.infinity,
                      margin: 220,
                    ),
                    playtypeBtnPhone(
                      playtype: "/Ski",
                      text: "스키장",
                      img: "assets/images/ski_background.jpg",
                      width: double.infinity,
                      margin: 220,
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }

  // 앱바
  AppBar homeAppbar() {
    return AppBar(
      //뒤로가기 버튼 없애기
      automaticallyImplyLeading: false,
      //배경화면 흰색 설정
      backgroundColor: Colors.white,
      // 앱바 밑 그림자
      title: SizedBox(
        height: 50,
        width: 120,
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
              style: TextStyle(color: Colors.grey[400]),
            ),
            const SizedBox(width: 10),
          ],
        )
      ],
    );
  }

  // 앱바 밑에 안내 문구
  Container mainText(txt) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Center(
        child: Text(
          txt,
          style: const TextStyle(
            fontSize: 20,
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
                style: const TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
