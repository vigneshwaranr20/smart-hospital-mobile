import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> submitAppointment(
    Map<String, dynamic> requestBody) async {
  // Convert the request body to a JSON string
  String requestBodyJson = json.encode(requestBody);

  // Make the API call
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/hospital/submitAppointment'),
    headers: {'Content-Type': 'application/json'},
    body: requestBodyJson,
  );

  // Decode the response body
  Map<String, dynamic> responseBody = json.decode(response.body);

  // Get the status from the response body
  var status = responseBody['status'];

  if (status == null) {
    return responseBody;
  } else {
    throw Exception('Failed to submit appointment');
  }
}
