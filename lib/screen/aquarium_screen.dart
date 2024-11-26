import 'package:dingga/widget/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AquariumScreen extends GetResponsiveView {
  AquariumScreen({super.key});

  // 변환되는 코드 초기화
  final Map<String, String> placeMap = {
    '코엑스 아쿠아리움': '1',
    '아쿠아플라넷 63': '2',
    '롯데월드 아쿠아리움': '3',
    '아쿠아플라넷 일산': '4',
    '아쿠아플라넷 광교': '5',
    '플레이아쿠아리움 부천': '6',
    '경포아쿠아리움': '7',
    '대전아쿠아리움': '8',
    '대전엑스포아쿠아리움': '9',
    '다누리아쿠아리움': '10',
    'SEA LIFE 부산아쿠아리움': '11',
    '아라마루 아쿠아리움': '12',
    '대구아쿠아리움': '13',
    '울진아쿠아리움': '14',
    '아쿠아플라넷 여수': '15',
    '아쿠아플라넷 제주': '16',
  };

  final Map<String, String> kategorieMap = {
    '운영시간': 'operating_hours',
    '이용요금': 'charge',
    '요금우대': 'fare_preference',
    '특이시설': 'special_facility',
    '편의시설': 'amenities',
    '음식점': 'restaurant',
    '주변 가볼만한곳': 'place_nearby',
    '대중교통': 'rt',
  };

  final String placeType = 'aquarium';

  @override
  Widget phone() {
    return MobileScreen(
      placeMap: placeMap,
      kategorieMap: kategorieMap,
      placeType: placeType,
      limitNum: 3,
      drawerWidth: 380,
    );
  }

  @override
  Widget tablet() {
    return MobileScreen(
      placeMap: placeMap,
      kategorieMap: kategorieMap,
      placeType: placeType,
      limitNum: 5,
      drawerWidth: 380,
    );
  }

  @override
  Widget desktop() {
    return DesktopScreen(
      placeMap: placeMap,
      kategorieMap: kategorieMap,
      placeType: placeType,
      drawerWidth: 380,
    );
  }
}
