import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider/screens/reattempt/model/model.dart';
import 'package:http/http.dart' as http;
class ReattemptController extends GetxController {
  var isLoading = false.obs;
  var bodyList = <Body>[].obs;
  bool _isFetchingData = false;
  bool _isInternetStable = false;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  Future<void> fetchData() async {
    if (_isFetchingData) return;
    _isFetchingData = true;
    checkAndShowInternetStatusSnackbar();
    try {
      var headers = {
        'Ridername': 'zainKhan',
        'Riderpassword': 'demo@1234',
        'Content-Type': 'application/json',
        'Cookie': 'PHPSESSID=fc5f9fd74d1006552eb94b08ea7dc0c1'
      };
      var body = {
        // "start_date": "2023-06-01",
        // "end_date": "2023-10-13",
        // "rider_code": "2719"
      };
      final response = await http.post(
        Uri.parse('https://falcon.onelogitech.com/api/riderapp_reattemptFecth'),
        headers: headers,
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        final reattemptModel = ReattemptModel.fromJson(jsonDecode(response.body));
        bodyList.assignAll(reattemptModel.data?.body ?? []);
      } else {
        throw Exception('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isFetchingData = false;
    }
  }
  Future<bool> checkInternetConnectivity() async {
    try {
      final result = await http.get(Uri.parse('https://www.google.com'));
      return result.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
// void checkAndShowInternetStatusSnackbar() async {
//   while (true) {
//     bool isConnected = await checkInternetConnectivity();

//     if (!isConnected) {
//       showSnackbar('No Internet Connection', 'Please check your internet connection and try again.', Colors.red);
//     } else if (isConnected && !_isInternetStable) {
//       showSnackbar('Internet Connection Restored', 'Your internet connection is stable now.', Colors.green);
//     }
//     _isInternetStable = isConnected;
//     await Future.delayed(Duration(seconds: 1));
//   }
// }
void checkAndShowInternetStatusSnackbar() async {
  while (true) {
    bool isConnected = await checkInternetConnectivity();

    if (!isConnected) {
      showSnackbar('No Internet Connection', 'Please check your internet connection and try again.', Colors.red);
    } 
    _isInternetStable = isConnected;
    await Future.delayed(Duration(seconds: 15));
  }
}
void showSnackbar(String title, String message, Color backgroundColor) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor,
    colorText: Colors.white,
  );
}
}