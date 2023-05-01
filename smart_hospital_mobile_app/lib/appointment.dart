import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:smart_hospital_mobile_app/main.dart';
import 'package:smart_hospital_mobile_app/register.dart';
import 'Api/dropdownapi.dart';
import 'History.dart';

class Appointment extends StatefulWidget {
  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  TextEditingController schedcontroller = TextEditingController();
  TextEditingController schedcontroller1 = TextEditingController();
  TextEditingController schedcontroller2 = TextEditingController();
  TextEditingController schedcontroller3 = TextEditingController();
  TextEditingController schedcontroller4 = TextEditingController();
  TextEditingController schedcontroller5 = TextEditingController();
  TextEditingController schedcontroller6 = TextEditingController();
  TextEditingController schedcontroller7 = TextEditingController();

  String? _selectedSpecialist;
  List<String> _specialists = [];
  List<String> _doctors = [];

  @override
  void initState() {
    super.initState();
    _getSpecialists();
    schedcontroller4.text = "";
  }

  Future<void> _getSpecialists() async {
    final specialists = await Api.getSpecialists();
    setState(() {
      _specialists = specialists;
    });
  }

  Future<void> _getDoctors() async {
    if (_selectedSpecialist != null) {
      final doctors = await Api.getDoctorsBySpecialist(_selectedSpecialist!);
      setState(() {
        _doctors = doctors;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext, BoxConstraints) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 430,
                        height: 450,
                        child: Image.network(
                            'https://img.freepik.com/free-vector/cardiologist-online-service-platform-idea-heart-care-medical-diagnostic-doctors-treat-heart-disease-online-appointment-flat-vector-illustration_613284-3189.jpg?w=740&t=st=1682761598~exp=1682762198~hmac=0331f22ddbc145f564944045af5419363e39cacc728e91af99ef08c732966746'),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 182),
                        width: 430,
                        height: 695,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Text('Book Appointment',
                                  style: TextStyle(
                                      color: Colors.cyan,
                                      fontSize: 16,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              width: 391,
                              height: 50,
                              margin:
                                  EdgeInsets.only(top: 34, left: 20, right: 19),
                              color: Color(0xffEAF4FF),
                              child: Container(
                                padding: EdgeInsets.only(left: 11),
                                child: TextField(
                                  controller: schedcontroller,
                                  decoration: InputDecoration(
                                      labelText: 'Patient Mobile Number',
                                      labelStyle: TextStyle(
                                          backgroundColor: Colors.white)),
                                ),
                              ),
                            ),
                            Container(
                              width: 391,
                              height: 50,
                              margin:
                                  EdgeInsets.only(top: 27, left: 20, right: 19),
                              color: Color(0xffEAF4FF),
                              child: Container(
                                padding: EdgeInsets.only(left: 11),
                                child: TextField(
                                  controller: schedcontroller1,
                                  decoration: InputDecoration(
                                      labelText: 'Patient Name',
                                      labelStyle: TextStyle(
                                          backgroundColor: Colors.white)),
                                ),
                              ),
                            ),
                            Container(
                              width: 391,
                              height: 50,
                              margin:
                                  EdgeInsets.only(top: 27, left: 20, right: 19),
                              color: Color(0xffEAF4FF),
                              child: Container(
                                padding: EdgeInsets.only(left: 11),
                                child: TextField(
                                  controller: schedcontroller2,
                                  decoration: InputDecoration(
                                      labelText: 'Patient Disease',
                                      labelStyle: TextStyle(
                                          backgroundColor: Colors.white)),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 156,
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        top: 27, left: 20, right: 10),
                                    color: Color(0xffEAF4FF),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 11),
                                      child: TextField(
                                        controller: schedcontroller3,
                                        decoration: InputDecoration(
                                          labelText: 'Patient Age',
                                          labelStyle: TextStyle(
                                              backgroundColor: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 156,
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        top: 27, left: 20, right: 10),
                                    color: Color(0xffEAF4FF),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 11),
                                      child: TextField(
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        controller: schedcontroller4,
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.calendar_today,
                                              color: Color(0xff707070)),
                                          labelText: "Schedule Date",
                                          labelStyle: TextStyle(
                                              color: Color(0xff707070),
                                              backgroundColor: Colors.white),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          disabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                        ),
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime.now()
                                                .add(Duration(days: 7)),
                                          );
                                          if (pickedDate != null) {
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                            setState(() {
                                              schedcontroller4.text =
                                                  formattedDate;
                                            });
                                          } else {
                                            print("Date is not selected");
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 391,
                              height: 50,
                              margin:
                                  EdgeInsets.only(top: 27, left: 20, right: 19),
                              color: Color(0xffEAF4FF),
                              child: Container(
                                padding: EdgeInsets.only(left: 11),
                                child: TextField(
                                  controller: schedcontroller5,
                                  decoration: InputDecoration(
                                      labelText: 'Patient Address',
                                      labelStyle: TextStyle(
                                          backgroundColor: Colors.white)),
                                ),
                              ),
                            ),
                            Container(
                              width: 391,
                              height: 50,
                              color: Color(0xffEAF4FF),
                              margin:
                                  EdgeInsets.only(left: 20, right: 19, top: 27),
                              child: DropdownButtonFormField<String>(
                                value: _selectedSpecialist,
                                hint: Container(
                                  padding: EdgeInsets.only(left: 11),
                                  color: Colors.white,
                                  child: const Text(
                                    'Select a Specialist',
                                    style: TextStyle(color: Color(0xff707070)),
                                  ),
                                ),
                                items: _specialists
                                    .map((specialist) => DropdownMenuItem(
                                          value: specialist,
                                          child: Text(
                                            specialist,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedSpecialist = value;
                                    _doctors.clear();
                                    _getDoctors();
                                  });
                                },
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 391,
                              height: 50,
                              color: Color(0xffEAF4FF),
                              margin:
                                  EdgeInsets.only(left: 20, right: 19, top: 27),
                              child: DropdownButtonFormField<String>(
                                value: _doctors.isEmpty ? null : _doctors[0],
                                hint: Container(
                                  padding: EdgeInsets.only(left: 11),
                                  color: Colors.white,
                                  child: Text(
                                    'Select a Doctor',
                                    style: TextStyle(color: Color(0xff707070)),
                                  ),
                                ),
                                items: _doctors
                                    .toSet()
                                    .toList()
                                    .map(
                                      (doctor) => DropdownMenuItem(
                                        value: doctor,
                                        child: Text(
                                          doctor,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _doctors[0] = value!;
                                  });
                                },
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 336, left: 10),
                                  width: 91,
                                  height: 91,
                                  child: Icon(
                                    Icons.circle_outlined,
                                    color: Color(0Xff1580EB),
                                    size: 90,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 21, left: 30),
                                  width: 51,
                                  height: 51,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_outlined,
                                    color: Color(0Xff1580EB),
                                    size: 50.0,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    String PatientMobileNumber =
                                        schedcontroller.text;
                                    String PatientName = schedcontroller1.text;
                                    String Patientdisease =
                                        schedcontroller2.text;
                                    String PatientAge = schedcontroller3.text;
                                    String Date = schedcontroller4.text;
                                    String PatientAddress =
                                        schedcontroller5.text;
                                    String Specialist = _selectedSpecialist!;
                                    String DoctorName = _doctors[0];

                                    // Create the request body
                                    Map<String, dynamic> requestBody = {
                                      "mobile_number": PatientMobileNumber,
                                      "name": PatientName,
                                      "disease": Patientdisease,
                                      "age": PatientAge,
                                      "date": Date,
                                      "address": PatientAddress,
                                      "Specialist": Specialist,
                                      "doctor_name": DoctorName
                                    };

                                    // Convert the request body to a JSON string
                                    String requestBodyJson =
                                        json.encode(requestBody);

                                    // Make the API call
                                    final response = await http.post(
                                      Uri.parse(
                                          'http://10.0.2.2:8080/hospital/submitAppointment'),
                                      headers: {
                                        'Content-Type': 'application/json'
                                      },
                                      body: requestBodyJson,
                                    );

                                    // Decode the response body
                                    Map<String, dynamic> responseBody =
                                        json.decode(response.body);

                                    // Get the status from the response body
                                    var status = responseBody['status'];

                                    // Print the status
                                    print('Status: $status');

                                    // Check if the status is '201'
                                    if (status == null) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Message'),
                                          content: Text(
                                            'Appointment scheduled successfully.',
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                String mobile =
                                                    schedcontroller.text;
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => History(
                                                          mobile:
                                                              PatientMobileNumber)),
                                                );
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                      // If the status is '201', navigate to the Appointment screen
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Error'),
                                          content: Text(
                                              'Failed to schedule appointment.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 280, right: 10),
                                        width: 91,
                                        height: 91,
                                        child: Icon(
                                          Icons.circle_outlined,
                                          color: Color(0Xff1580EB),
                                          size: 90,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 21, left: 300),
                                        width: 51,
                                        height: 51,
                                        decoration: BoxDecoration(
                                          color: Color(0Xff1580EB),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Icon(
                                          Icons.arrow_right_alt_sharp,
                                          color: Colors.white,
                                          size: 50.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 56,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 40,
                      color: Color(0Xff414141),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SmartHospital()),
                      );
                    },
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.event_note_rounded,
                          size: 35,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      top: 4,
                      left: 4,
                      right: 0,
                      child: Container(
                        height: 0,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.blue,
                              width: 5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.list_alt,
                      size: 40,
                      color: Color(0Xff414141),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 40,
                      color: Color(0Xff1580EB),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
