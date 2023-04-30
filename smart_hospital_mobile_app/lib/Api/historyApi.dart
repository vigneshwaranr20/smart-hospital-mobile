import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/historymodel.dart';

class HistoryDataApi {
  Future<Historydata> mobileNum(String PatientMobileNumber) async {
    Map<String, dynamic> requestBody = {"mobile_number": PatientMobileNumber};
    String requestBodyJson = json.encode(requestBody);
    print(requestBodyJson);

    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/hospital/getHistoryData'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestBodyJson,
    );
    if (response.statusCode == 200) {
      print('vky');
      return Historydata.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to submit appointment');
    }
  }
}
