import 'package:dingga/widget/place_controller.dart';
import 'package:dingga/widget/place_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      key: drawerController.scaffoldKey,
      appBar: placeAppbar(context),
      endDrawer: Drawer(
        width: drawerWidth,
        child: selectBtns(
          placeType,
          btnController,
          placeController,
          limitNum,
          true,
        ),
      ),
      body: getTable(placeController, drawerController, 0.3),
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
    return Scaffold(
      appBar: placeAppbar(context),
      body: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.all(15),
              alignment: Alignment.topCenter,
              child: getTable(placeController, drawerController, 0.15),
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
            ),
          )
        ],
      ),
    );
  }
}
