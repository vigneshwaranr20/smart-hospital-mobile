import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import 'Login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController RegController = TextEditingController();
  TextEditingController RegController1 = TextEditingController();
  TextEditingController RegController2 = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext, BoxConstraints) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 50),
                    width: 430,
                    height: 416,
                    child: Image.network(
                        'https://ethicadata.com/landing-page/static/a357a07b3a8748b4d6c6e7ff3ac30f8b/085d1/infectious-diseases-and-vaccines.webp'),
                  ),
                  Container(
                    width: 430,
                    height: 441,
                    child: Column(
                      children: [
                        Container(
                          width: 430,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                            color: Colors.cyan,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 215,
                                height: 48,
                                color: Colors.white,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Color(0xFF1580EB),
                                      fontFamily: 'Arial',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 78),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Arial',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 250, top: 10),
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
                          margin: EdgeInsets.only(top: 26, left: 20, right: 19),
                          color: Color(0xffEAF4FF),
                          child: TextField(
                            controller: RegController,
                            decoration: InputDecoration(
                                labelText: 'Mobile NUmber',
                                labelStyle:
                                    TextStyle(backgroundColor: Colors.white)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 38, left: 20, right: 19),
                          width: 391,
                          height: 50,
                          color: Color(0xffEAF4FF),
                          child: TextField(
                            controller: RegController1,
                            decoration: InputDecoration(
                                labelText: 'Create Password',
                                labelStyle:
                                    TextStyle(backgroundColor: Colors.white)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 38, left: 20, right: 19),
                          width: 391,
                          height: 50,
                          color: Color(0xffEAF4FF),
                          child: TextField(
                            controller: RegController2,
                            decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                labelStyle:
                                    TextStyle(backgroundColor: Colors.white)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String mobileNumber = RegController.text;
                            String createPassword = RegController1.text;
                            String confirmpassword = RegController2.text;
                            Map<String, dynamic> requestBody = {
                              'mobile_number': mobileNumber,
                              'create_password': createPassword,
                              'confirm_password': confirmpassword,
                            };
                            String requestBodyJson = json.encode(requestBody);
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
                                builder: (context) => AlertDialog(
                                  content: Text(
                                    'Already Register User Please Login',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()),
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
                                builder: (context) => AlertDialog(
                                  content: Text(
                                    'Your Successfully Registered Please Login',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()),
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
                                width: 91,
                                height: 91,
                                child: Icon(
                                  Icons.circle_outlined,
                                  color: Color(0Xff1580EB),
                                  size: 90,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 21, left: 20),
                                width: 51,
                                height: 51,
                                decoration: BoxDecoration(
                                  color: Color(0Xff1580EB),
                                  borderRadius: BorderRadius.circular(50.0),
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
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.event_note_rounded,
                      size: 40,
                      color: Color(0Xff414141),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.list_alt,
                      size: 40,
                      color: Color(0Xff414141),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 40,
                      color: Color(0Xff1580EB),
                    ),
                    onPressed: () {},
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
