import 'package:dingga/widget/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeparkScreen extends GetResponsiveView {
  ThemeparkScreen({super.key});

  // 변환되는 코드 초기화
  final Map<String, String> placeMap = {
    '롯데월드': '1',
    '서울랜드': '2',
    '에버랜드': '3',
    '이월드': '4',
    '경주월드': '5',
    '광주패밀리랜드': '6',
    '롯데월드 부산': '7',
    '신화테마파크': '8',
  };

  final Map<String, String> kategorieMap = {
    '운영시간': 'operating_hours',
    '이용요금': 'charge',
    '요금우대': 'fare_preference',
    '편의시설': 'amenities',
    '장애인 편의시설': 'amenities_pwd',
    '가족 편의시설': 'amenities_fam',
    '음식점': 'restaurant',
    '대중교통': 'rt',
    '주변 가볼만한곳': 'place_nearby',
  };
  final String placeType = 'themepark';

  // final btnController = Get.put(BtnController());
  // final placeController = Get.put(PlaceDataController());
  // final drawerController = Get.put(CustomDrawerController());

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
    );
  }

  @override
  Widget desktop() {
    // 컨트롤러 초기화
    // btnController.initializeMaps(placeMap, kategorieMap);
    // return Builder(
    //   builder: (context) {
    //     return Scaffold(
    //       appBar: placeAppbar(context),
    //       body: Row(
    //         children: [
    //           Flexible(
    //             fit: FlexFit.tight,
    //             child: Container(
    //               margin: const EdgeInsets.all(15),
    //               alignment: Alignment.topCenter,
    //               child: getTable(placeController, drawerController, 0.15),
    //             ),
    //           ),
    //           const VerticalDivider(color: Colors.black26),
    //           SizedBox(
    //             width: 300,
    //             child: selectBtns(
    //               placeType,
    //               btnController,
    //               placeController,
    //               5,
    //               false,
    //             ),
    //           )
    //         ],
    //       ),
    //     );
    //   },
    // );
    return DesktopScreen(
      placeMap: placeMap,
      kategorieMap: kategorieMap,
      placeType: placeType,
    );
  }
}
