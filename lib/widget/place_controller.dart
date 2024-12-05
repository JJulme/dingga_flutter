import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 버튼 관리 Controller
class BtnController extends GetxController {
  // 변수로 받아올 수 있도록 설정
  RxMap<String, String> placeMap = <String, String>{}.obs;
  RxMap<String, String> kategorieMap = <String, String>{}.obs;

  RxList<String> selectedPlace = <String>[].obs;
  RxList<String> selectedKategorie = <String>[].obs;

  RxList<String> selectedPlaceCode = <String>[].obs;
  RxList<String> selectedKategorieCode = <String>[].obs;

  // 초기화 함수
  void initializeMaps(
    Map<String, String> initialPlaceMap,
    Map<String, String> initialKategorieMap,
  ) {
    placeMap.assignAll(initialPlaceMap);
    kategorieMap.assignAll(initialKategorieMap);
  }

  // Kategorie 변수의 값을 변경 시킬 함수
  void tapKategorie(String kategorie) {
    // 선택하면 리스트에 추가
    if (selectedKategorieCode.contains(kategorieMap[kategorie])) {
      selectedKategorie.remove(kategorie);
      selectedKategorieCode.remove(kategorieMap[kategorie]);
    } else {
      selectedKategorie.add(kategorie);
      selectedKategorieCode.add(kategorieMap[kategorie]!);
    }
  }

  // Place 변수의 값을 변경 시킬 함수
  void tapPlace(String place, int maxNum) {
    // 코드가 리스트 안에 있으면 제거
    if (selectedPlaceCode.contains(placeMap[place])) {
      // 장소 이름과 코드를 각각의 리스트에서 제거
      selectedPlace.remove(place);
      selectedPlaceCode.remove(placeMap[place]);
    } else {
      if (selectedPlace.length >= maxNum) {
        if (!Get.isSnackbarOpen) {
          Get.snackbar("안내", "최대 $maxNum개 까지 선택 가능");
        }
      }
      // 장소 이름과 코드가 리스트 내에 없으면 추가
      else {
        // 장소 이름과 코드를 각각의 리스트에 저장
        selectedPlace.add(place);
        selectedPlaceCode.add(placeMap[place]!);
      }
    }
  }

  // 장소, 항목의 리스트를 문자열로 바꿔서 하나의 리스트로 만들어줌
  List<dynamic> convertString() {
    String placeString = selectedPlaceCode.join(',');
    String kategorieString = selectedKategorieCode.join(',');
    // 장소와 정보 순서대로 정렬해서 저장
    var placeOrder =
        selectedPlace.where((e) => selectedPlace.contains(e)).toList();
    var kategorieOrder =
        selectedKategorie.where((e) => selectedKategorie.contains(e)).toList();
    // 선택 정보 추가
    placeOrder.insert(0, "선택정보");
    return [placeString, kategorieString, placeOrder, kategorieOrder];
  }
}

// 가져올 데이터 관리 Controller
class PlaceDataController extends GetxController {
  // Dio 초기 설정
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.dingga.shop',
      connectTimeout: const Duration(seconds: 5), // 연결 타임아웃 설정
      receiveTimeout: const Duration(seconds: 3), // 응답 타임아웃 설정
    ),
  );

  RxList<dynamic> dataList = [].obs;
  var isLoading = false.obs;
  var placeList = [].obs;
  var kategorieList = [].obs;

  Future<void> getApi(
    String place,
    String id,
    String fields,
    List places,
    List kategories,
  ) async {
    // 로딩중
    isLoading.value = true;
    placeList.value = places;
    kategorieList.value = kategories;
    try {
      final response = await _dio.get('/$place/?id=$id&fields=$fields');
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        dataList.value = jsonData;
      } else {
        throw Exception('Failed to load themepark data');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // ignore: avoid_print
        print(
            'Error: ${e.response?.statusCode} - ${e.response?.statusMessage}');
        // ignore: avoid_print
        print('Data: ${e.response?.data}');
      } else {
        print('Error: ${e.message}');
      }
      rethrow;
    } catch (e) {
      // ignore: avoid_print
      print('Unexpected Error: $e');
      rethrow;
    } finally {
      // 로딩완료
      isLoading.value = false;
    }
  }
}

class CustomDrawerController extends GetxController {
  // GlobalKey를 사용하여 Scaffold의 상태를 관리
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }
}
