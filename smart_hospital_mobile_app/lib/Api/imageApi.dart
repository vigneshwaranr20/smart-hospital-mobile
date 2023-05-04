import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/imagemodel.dart';

class doctorDetails {
  Future<Welcome> getImages() async {
    final response = await http.post(
      Uri.parse('http://192.168.1.141:8080/hospital/AllDoctorsDetails'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print('vky');
      print(jsonDecode(response.body));

      return Welcome.fromJson(jsonDecode(response.body));
    } else {
      print('error');
      throw Exception('Failed to fetch image');
    }
  }
}
