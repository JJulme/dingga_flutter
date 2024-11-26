import 'package:dingga/widget/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkiScreen extends GetResponsiveView {
  SkiScreen({super.key});

  // 변환되는 코드 초기화
  final Map<String, String> placeMap = {
    '곤지암리조트': '1',
    '지산리조트': '2',
    '엘리시안 강촌': '3',
    '비발디파크': '4',
    '알펜시아': '5',
    '오크벨리': '6',
    '오투리조트': '7',
    '용평리조트': '8',
    '하이원 리조트': '9',
    '휘닉스파크': '10',
    '덕유산 리조트': '11',
    '에덴벨리 리조트': '12',
  };

  final Map<String, String> kategorieMap = {
    '운영시간': 'operating_hours',
    '이용요금': 'charge',
    '장비랜탈': 'rental_equipment',
    '의류랜탈': 'rental_clothing',
    '눈썰매장': 'sledding',
    '요금우대': 'fare_preference',
    '특이시설': 'special_facility',
    '음식점': 'restaurant',
    '편의시설': 'amenities',
    '셔틀버스': 'shuttle',
    '대중교통': 'rt',
  };

  final String placeType = 'ski';

  @override
  Widget phone() {
    return MobileScreen(
      placeMap: placeMap,
      kategorieMap: kategorieMap,
      placeType: placeType,
      limitNum: 3,
    );
  }

  @override
  Widget tablet() {
    return MobileScreen(
      placeMap: placeMap,
      kategorieMap: kategorieMap,
      placeType: placeType,
      limitNum: 5,
    );
  }

  @override
  Widget desktop() {
    return DesktopScreen(
      placeMap: placeMap,
      kategorieMap: kategorieMap,
      placeType: placeType,
    );
  }
}
