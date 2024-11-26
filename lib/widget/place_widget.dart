import 'package:dingga/widget/place_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 기본 AppBar 생성
AppBar placeAppbar(context) {
  return AppBar(
    //뒤로가기 버튼 없애기
    automaticallyImplyLeading: false,
    //배경화면 흰색 설정
    backgroundColor: Colors.white,
    title: Row(
      children: [
        // 로고 설정
        SizedBox(
          height: 50,
          width: 120,
          child: InkWell(
            onTap: () => Get.offAllNamed("/"),
            child: Image.asset("assets/images/dingga_logo2.png"),
          ),
        ),
      ],
    ),
  );
}

Widget selectBtns(
  String place,
  BtnController btncontroller,
  PlaceDataController placeController,
  int limitNum,
  bool trueBack,
) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 표만들기 버튼
          SizedBox(
            height: 50,
            width: double.infinity,
            child: OutlinedButton(
              child: const Center(
                child: Text(
                  "표만들기",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              onPressed: () async {
                // 선택한 장소가 없을때
                if (btncontroller.selectedPlace.isEmpty) {
                  if (!Get.isSnackbarOpen) {
                    Get.snackbar("Error", "장소를 선택하세요");
                  }
                }
                // 선택한 정보가 없을 때
                else if (btncontroller.selectedKategorie.isEmpty) {
                  if (!Get.isSnackbarOpen) {
                    Get.snackbar("Error", "정보를 선택하세요");
                  }
                }
                // 장소, 항목을 선택했을 때
                else {
                  List<dynamic> code = btncontroller.convertString();
                  // api 정보 보내는 자리
                  placeController.getApi(
                      place, code[0], code[1], code[2], code[3]);
                  // 뒤로가기 기능
                  trueBack ? Get.back() : null;
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 장소 선택 버튼
              Flexible(
                flex: 1,
                fit: FlexFit.tight, // 남은 공간 전부 차지
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 장소 개수대로 생성되는 for 문
                    for (String place in btncontroller.placeMap.keys)
                      // 누를 때 색 변화를 위해 Obx 사용
                      Obx(() {
                        String placeCode = btncontroller.placeMap[place]!;
                        bool isSelected =
                            btncontroller.selectedPlaceCode.contains(placeCode);
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                // 색 변경
                                backgroundColor:
                                    isSelected ? Colors.lime : Colors.lime[100],
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            onPressed: () {
                              // 눌렀을 때 리스트에 추가/제거, 선택할 수 있는 버튼 수 제한
                              btncontroller.tapPlace(place, limitNum);
                            },
                            child: Text(
                              place,
                              maxLines: 1,
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ),
                        );
                      }),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              // 정보 선택 버튼
              Flexible(
                flex: 1,
                fit: FlexFit.tight, // 남은 공간 전부 차지
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 정보의 개수 만큼 버튼 생성
                    for (String kategorie in btncontroller.kategorieMap.keys)
                      // 누르면 색이 변경되도록 Obx 사용
                      Obx(() {
                        String kategorieCode =
                            btncontroller.kategorieMap[kategorie]!;
                        bool isSelected = btncontroller.selectedKategorieCode
                            .contains(kategorieCode);
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              // 누르면 색 변경
                              backgroundColor:
                                  isSelected ? Colors.amber : Colors.amber[100],
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              // 누른 정보 리스트에 추가
                              btncontroller.tapKategorie(kategorie);
                            },
                            child: Text(
                              kategorie,
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ),
                        );
                      })
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Obx getTable(
  PlaceDataController placeController,
  CustomDrawerController drawerController,
  double tableWidth,
) {
  return Obx(
    () {
      // 데이터 로딩중
      if (placeController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      RxList<dynamic> tableData = placeController.dataList;
      return tableData.isEmpty
          // 그려낼 데이터가 없는 경우
          // 빈화면 누를경우 endDrawer 열기 - desktop의 경우 endDrawer 없어서 눌러도 동작없음
          ? InkWell(
              onTap: () => drawerController.openEndDrawer(),
              // 호버 색상, 클릭시 색상 제거
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: const Center(child: Text("장소와 정보를 선택해 주세요.")),
            )
          // 테이블 그리기
          : InkWell(
              onTap: () => drawerController.openEndDrawer(),
              // 호버 색상, 클릭시 색상 제거
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("※ 해당 정보는 다를 수 있습니다."),
                    const SizedBox(height: 15),
                    // Table 생성
                    Table(
                      // 선택한 정보칸 크기 설정
                      // 보여줄 정보들은 남은 공간을 자동으로 나누어 가짐
                      columnWidths: {0: FractionColumnWidth(tableWidth)},
                      border: const TableBorder(
                          horizontalInside:
                              BorderSide(width: .5, color: Colors.black54)),
                      children: [
                        // 맨위 선택한 위치 보여줄 Column
                        TableRow(
                          children: [
                            for (var place in placeController.placeList)
                              Container(
                                height: 50,
                                color: Colors.amber[200],
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  place,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                          ],
                        ),
                        // 선택한 정보와 가져온 정보 보여줌
                        // 선택한 정보 만큼 행 생성
                        for (int i = 0;
                            i < placeController.kategorieList.length;
                            i++)
                          TableRow(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  placeController.kategorieList[i],
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              for (int j = 0;
                                  j < placeController.placeList.length - 1;
                                  j++)
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    tableData[j].values.toList()[i],
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                            ],
                          )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
    },
  );
}