import 'package:dingga/widget/place_controller.dart';
import 'package:dingga/widget/place_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class MobileScreen extends StatelessWidget {
  final Map<String, String> placeMap;
  final Map<String, String> kategorieMap;
  final String placeType;
  final double drawerWidth;
  final int limitNum;

  final BtnController btnController = Get.put(BtnController());
  final PlaceDataController placeController = Get.put(PlaceDataController());
  final CustomDrawerController drawerController =
      Get.put(CustomDrawerController());

  MobileScreen({
    required this.placeMap,
    required this.kategorieMap,
    required this.placeType,
    this.drawerWidth = 360,
    required this.limitNum,
    super.key,
  }) {
    // 컨트롤러 초기화
    btnController.initializeMaps(placeMap, kategorieMap);
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery를 사용하여 화면 너비와 높이를 가져옵니다.
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // 대각선 크기 계산
    double diagonal =
        sqrt(screenWidth * screenWidth + screenHeight * screenHeight);
    return Scaffold(
      key: drawerController.scaffoldKey,
      appBar: placeAppbar(context, diagonal),
      endDrawer: Drawer(
        width: drawerWidth,
        child: selectBtns(
          placeType,
          btnController,
          placeController,
          limitNum,
          true,
          diagonal,
        ),
      ),
      body: getTable(
        placeController,
        drawerController,
        0.0003 * diagonal,
        diagonal,
      ),
    );
  }
}

class DesktopScreen extends StatelessWidget {
  final Map<String, String> placeMap;
  final Map<String, String> kategorieMap;
  final String placeType;
  final double drawerWidth;

  final BtnController btnController = Get.put(BtnController());
  final PlaceDataController placeController = Get.put(PlaceDataController());
  final CustomDrawerController drawerController =
      Get.put(CustomDrawerController());

  DesktopScreen({
    required this.placeMap,
    required this.kategorieMap,
    required this.placeType,
    this.drawerWidth = 300,
    super.key,
  }) {
    // 컨트롤러 초기화
    btnController.initializeMaps(placeMap, kategorieMap);
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery를 사용하여 화면 너비와 높이를 가져옵니다.
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // 대각선 크기 계산
    double diagonal =
        sqrt(screenWidth * screenWidth + screenHeight * screenHeight);
    return Scaffold(
      appBar: placeAppbar(context, 0.75 * diagonal),
      body: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.all(15),
              alignment: Alignment.topCenter,
              child: getTable(
                placeController,
                drawerController,
                0.0001 * diagonal,
                0.7 * diagonal,
              ),
            ),
          ),
          const VerticalDivider(color: Colors.black26),
          Container(
            alignment: Alignment.topCenter,
            width: drawerWidth,
            child: selectBtns(
              placeType,
              btnController,
              placeController,
              7,
              false,
              0.75 * diagonal,
            ),
          )
        ],
      ),
    );
  }
}
