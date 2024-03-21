import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rider/screens/home/circular_progress_modal/circular_progress_modal.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  var progressIndicator = Rxn<HomeCircularProgressIndicator>();

  Future<void> fetchData() async {
    var headers = {
      'Ridername': 'zainKhan',
      'Riderpassword': 'demo@1234',
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=883e15b2a7e126ee363179e09ac7a71c'
    };
    var body = json.encode({"rider_code": "2719"});
    final response = await http.post(
      Uri.parse('https://falcon.onelogitech.com/api/riderapp_dashboardcount'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      progressIndicator.value =
          HomeCircularProgressIndicator.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
}
