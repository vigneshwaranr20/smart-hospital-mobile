import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const String _baseUrl = 'http://192.168.1.141:8080/hospital';

  static Future<List<String>> getSpecialists() async {
    final response = await http.post(Uri.parse('$_baseUrl/getSpecialistdata'));
    final data = jsonDecode(response.body) as List<dynamic>;
    return data.map<String>((value) => value.toString()).toList();
  }

  static Future<List<String>> getDoctorsBySpecialist(String specialist) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/getDoctordata'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'specialist': specialist}),
    );
    dynamic data = jsonDecode(response.body);

    if (data is Map<String, dynamic>) {
      return data.values.map<String>((value) => value.toString()).toList();
    } else {
      // Handle the case where the response is not a list of doctors.
      print('Error retrieving doctors by specialist: $data');
      return [];
    }
  }
}
