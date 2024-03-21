import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rider/screens/fetch_order/fetch_order_modal/fetch_order_modal.dart';
class OrderController extends GetxController {
   var isLoading = true.obs;
  final orders = <Map<String, dynamic>>[].obs;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
Future<void> fetchData() async {
  final apiUrl = 'https://falcon.onelogitech.com/api/riderapp_loadsheet';
  final headers = {
    'Ridername': 'zainKhan',
    'Riderpassword': 'demo@1234',
    'Content-Type': 'application/json',
    'Cookie': 'PHPSESSID=ff9b133ff5fc192915fc79a0450c4944'
  };
  final requestBody = {"master_no": "1"};
  try {
    final response = await http.post(Uri.parse(apiUrl),
        headers: headers, body: jsonEncode(requestBody));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> body = jsonResponse['data']['body'];
      orders.assignAll(body.cast<Map<String, dynamic>>());
      isLoading(false);
    } else {
      print('HTTP Error: ${response.statusCode}');
      throw Exception('Failed to load order data');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Failed to load order data: $e');
  }
}
}
