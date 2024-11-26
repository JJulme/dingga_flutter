import 'package:dingga/widget/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZooScreen extends GetResponsiveView {
  ZooScreen({super.key});

  // 변환되는 코드 초기화
  final Map<String, String> placeMap = {
    '서울대공원': '1',
    '어린이대공원': '2',
    '에버랜드 주토피아': '3',
    '대전오월드 쥬랜드': '4',
    '전주동물원': '5',
    '우치동물원': '6',
    '쥬쥬랜드 동물원': '7',
    '청주랜드 동물원': '8',
    '진양호동물원': '9',
    '인천대공원 어린이동물원': '10',
  };

  final Map<String, String> kategorieMap = {
    '운영시간': 'operating_hours',
    '이용요금': 'charge',
    '요금우대': 'fare_preference',
    '대표동물': 'animal',
    '특이시설': 'special_facility',
    '음식점': 'restaurant',
    '주변 가볼만한곳': 'place_nearby',
    '편의시설': 'amenities',
    '대중교통': 'rt',
  };

  final String placeType = 'zoo';

  @override
  Widget phone() {
    // 컨트롤러 초기화
    // btnController.initializeMaps(placeMap, kategorieMap);
    // return Builder(
    //   builder: (context) {
    //     return Scaffold(
    //       key: drawerController.scaffoldKey,
    //       appBar: placeAppbar(context),
    //       endDrawer: Drawer(
    //         width: 360,
    //         child: selectBtns(
    //           placeType,
    //           btnController,
    //           placeController,
    //           3,
    //           true,
    //         ),
    //       ),
    //       body: getTable(placeController, drawerController, 0.3),
    //     );
    //   },
    // );
    return MobileScreen(
      placeMap: placeMap,
      kategorieMap: kategorieMap,
      placeType: placeType,
      limitNum: 3,
      drawerWidth: 360,
    );
  }

  @override
  Widget tablet() {
    // 컨트롤러 초기화
    // btnController.initializeMaps(placeMap, kategorieMap);
    // return Builder(
    //   builder: (context) {
    //     return Scaffold(
    //       key: drawerController.scaffoldKey,
    //       appBar: placeAppbar(context),
    //       endDrawer: Drawer(
    //         width: 360,
    //         child: selectBtns(
    //           placeType,
    //           btnController,
    //           placeController,
    //           5,
    //           true,
    //         ),
    //       ),
    //       body: getTable(placeController, drawerController, 0.15),
    //     );
    //   },
    // );
    return MobileScreen(
      placeMap: placeMap,
      kategorieMap: kategorieMap,
      placeType: placeType,
      limitNum: 5,
      drawerWidth: 360,
    );
  }

  @override
  Widget desktop() {
    return DesktopScreen(
      placeMap: placeMap,
      kategorieMap: kategorieMap,
      placeType: placeType,
      drawerWidth: 360,
    );
  }
}
