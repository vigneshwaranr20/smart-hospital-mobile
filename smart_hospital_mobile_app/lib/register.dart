import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:smart_hospital_mobile_app/history.dart';

import 'Login.dart';
import 'appointment.dart';
import 'main.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController RegController = TextEditingController();
  TextEditingController RegController1 = TextEditingController();
  TextEditingController RegController2 = TextEditingController();
  bool _validate = false;
  bool _showLoginContent = true;
  bool _showRegisterContent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Container(
          color: Color(0xffffffff),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 430,
                    height: 420,
                    child: Image.network(
                        'https://ethicadata.com/landing-page/static/a357a07b3a8748b4d6c6e7ff3ac30f8b/085d1/infectious-diseases-and-vaccines.webp'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 446),
                    width: MediaQuery.of(context)
                        .size
                        .width, // use full width of screen
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // center the buttons horizontally
                      children: [
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                // bottomLeft: Radius.circular(20),
                              ),
                              color: _showLoginContent
                                  ? Color(0xff1580EB)
                                  : Color(0xffffffff),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _showLoginContent = true;
                                  _showRegisterContent = false;
                                });
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: _showLoginContent
                                      ? Color(0xffffffff)
                                      : Color(0xFF1580EB),
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                // bottomRight: Radius.circular(20),
                              ),
                              color: _showLoginContent
                                  ? Color(0xFFFFFFFF)
                                  : Color(0xff1580EB),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _showLoginContent = false;
                                  _showRegisterContent = true;
                                });
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: _showLoginContent
                                      ? Color(0xff1580EB)
                                      : Color(0xffffffff),
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 400),
                        padding: EdgeInsets.all(20),
                        child: _showLoginContent
                            ?
                            //code for login form
                            Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Login text
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, top: 80),
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 26,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: 391,
                                      height: 50,
                                      margin: EdgeInsets.only(
                                        top: 26,
                                      ),
                                      color: Color(0xffEAF4FF),
                                      child: TextField(
                                        controller: _controller,
                                        decoration: InputDecoration(
                                            labelText: 'Mobile Number',
                                            labelStyle: TextStyle(
                                                backgroundColor: Colors.white)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 38,
                                      ),
                                      width: 391,
                                      height: 50,
                                      color: Color(0xffEAF4FF),
                                      child: TextField(
                                        controller: _controller1,
                                        decoration: InputDecoration(
                                            labelText: ' Password',
                                            labelStyle: TextStyle(
                                                backgroundColor: Colors.white)),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        String mobileNumber = _controller.text;
                                        String password = _controller1.text;
                                        Map<String, dynamic> requestBody = {
                                          'mobile_number': mobileNumber,
                                          'create_password': password,
                                        };
                                        String requestBodyJson =
                                            json.encode(requestBody);
                                        print(requestBodyJson);

                                        final response = await http.post(
                                          Uri.parse(
                                              'http://10.0.2.2:8080/hospital/Login'),
                                          headers: {
                                            'Content-Type': 'application/json',
                                          },
                                          body: requestBodyJson,
                                        );
                                        Map<String, dynamic> responseBody =
                                            json.decode(response.body);

                                        var status = responseBody['status'];

                                        print('Status: $status');

                                        if (status == '201') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Appointment()),
                                          );
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: Text('Error'),
                                              content: Text(
                                                  'Check Mobile Number and Password.'),
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
                                            margin: EdgeInsets.only(left: 130),
                                            width: 91,
                                            height: 91,
                                            child: Icon(
                                              Icons.circle_outlined,
                                              color: Color(0Xff1580EB),
                                              size: 90,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 21, left: 150),
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
                              )
                            :
                            //code for register form
                            Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //register text
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, top: 80),
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 26,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: 391,
                                      height: 50,
                                      margin: EdgeInsets.only(
                                        top: 26,
                                      ),
                                      color: Color(0xffEAF4FF),
                                      child: TextField(
                                        controller: RegController,
                                        decoration: InputDecoration(
                                            labelText: 'Mobile Number',
                                            labelStyle: TextStyle(
                                                backgroundColor: Colors.white)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 38,
                                      ),
                                      width: 391,
                                      height: 50,
                                      color: Color(0xffEAF4FF),
                                      child: TextField(
                                        controller: RegController1,
                                        decoration: InputDecoration(
                                            labelText: 'Create Password',
                                            labelStyle: TextStyle(
                                                backgroundColor: Colors.white)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 38,
                                      ),
                                      width: 391,
                                      height: 50,
                                      color: Color(0xffEAF4FF),
                                      child: TextField(
                                        controller: RegController2,
                                        decoration: InputDecoration(
                                            labelText: 'Confirm Password',
                                            labelStyle: TextStyle(
                                                backgroundColor: Colors.white)),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        String mobileNumber =
                                            RegController.text;
                                        String createPassword =
                                            RegController1.text;
                                        String confirmpassword =
                                            RegController2.text;
                                        Map<String, dynamic> requestBody = {
                                          'mobile_number': mobileNumber,
                                          'create_password': createPassword,
                                          'confirm_password': confirmpassword,
                                        };
                                        String requestBodyJson =
                                            json.encode(requestBody);
                                        print(requestBodyJson);

                                        final response = await http.post(
                                          Uri.parse(
                                              'http://10.0.2.2:8080/hospital/Register'),
                                          headers: {
                                            'Content-Type': 'application/json',
                                          },
                                          body: requestBodyJson,
                                        );
                                        Map<String, dynamic> responseBody =
                                            json.decode(response.body);
                                        var status = responseBody['status'];
                                        print('Status: $status');

                                        if (status == '201') {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              content: Text(
                                                'Already Register User Please Login',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Login()),
                                                    );
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              content: Text(
                                                'Your Successfully Registered Please Login',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Register()),
                                                    );
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
                                            margin: EdgeInsets.only(left: 130),
                                            width: 91,
                                            height: 91,
                                            child: Icon(
                                              Icons.circle_outlined,
                                              color: Color(0Xff1580EB),
                                              size: 90,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 21, left: 150),
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
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )),
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
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.event_note_rounded,
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
