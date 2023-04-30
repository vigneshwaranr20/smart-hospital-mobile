import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_hospital_mobile_app/register.dart';
import 'package:smart_hospital_mobile_app/splash_screen.dart';
import 'package:http/http.dart' as http;
import 'Api/imageApi.dart';
import 'Login.dart';
import 'appointment.dart';
import 'model/imagemodel.dart';

void main() {
  runApp(MaterialApp(
    home: SmartHospital(),
    debugShowCheckedModeBanner: false,
  ));
}

class SmartHospital extends StatefulWidget {
  @override
  State<SmartHospital> createState() => _SmartHospitalState();
}

class _SmartHospitalState extends State<SmartHospital> {
  final doctorDetail = doctorDetails();
  List<Doctor> doctorList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Welcome empty = await doctorDetail.getImages();

    setState(() {
      doctorList = empty.doctors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEAF4FF),
        title: Row(
          children: [
            Image.asset(
              'images/Group 28.png',
              height: 37.51,
              width: 129.93,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 1),
                height: 40,
                width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Icon(
                        Icons.search,
                        color: Color(0xff979797),
                      ),
                      margin: EdgeInsets.only(left: 16),
                      width: 20,
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 17,
                        margin: EdgeInsets.only(left: 10, top: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            color: Color(0xffEAF4FF),
            height: 932,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Color(0xff1580EB),
                        height: 134,
                        width: 390,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    'Easy Same or Next day \n Appointment',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                  margin: EdgeInsets.only(left: 10, bottom: 50),
                                ),
                                Container(
                                  width: 165,
                                  height: 118,
                                  margin: EdgeInsets.only(top: 8),
                                  child: Image.network(
                                      'https://img.freepik.com/free-photo/doctor-with-stethoscope-hands-hospital-background_1423-1.jpg?w=740&t=st=1682680903~exp=1682681503~hmac=9b33272404fbe431ef957e2a3461b4a4cadb1f4b698ab74855ee031ac02f223d'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 82, right: 200),
                        child: ButtonBar(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text(
                                'Appointment Book ',
                                style: TextStyle(
                                  color: Color(0xff1580EB),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 282),
                    child: Text(
                      'Category',
                      style: TextStyle(
                          color: Color(0xff1580EB),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 8, left: 10),
                          child: ButtonBar(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    backgroundColor: Colors.blue),
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8, left: 0),
                          child: ButtonBar(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    backgroundColor: Colors.white),
                                child: Text(
                                  'Genral Surgeon',
                                  style: TextStyle(
                                    color: Color(0xff1580EB),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8, left: 10),
                          child: ButtonBar(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    backgroundColor: Colors.white),
                                child: Text(
                                  'Endocronoligist',
                                  style: TextStyle(
                                    color: Color(0xff1580EB),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8, left: 10),
                          child: ButtonBar(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    backgroundColor: Colors.white),
                                child: Text(
                                  'Cardialogist',
                                  style: TextStyle(
                                    color: Color(0xff1580EB),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 19),
                    color: Color(0xffECF3FA),
                    child: Text(
                      'Meet our Specialist',
                      style: TextStyle(
                          color: Color(0xff1580EB),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 390,
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              doctorList.length < 2 ? doctorList.length : 2,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 188,
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 10.0 : 0.0,
                                    right: 10.0,
                                    top: 15.0),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 0.0, top: 10.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          doctorList[index].doctorImage,
                                          fit: BoxFit.cover,
                                          width: 152.0,
                                          height: 145.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 9.0),
                                      child: Text(
                                        doctorList[index].doctorName,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 1.0),
                                      child: Text(
                                        doctorList[index].specialist,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 390,
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              doctorList.length < 2 ? doctorList.length : 2,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 188,
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 10.0 : 0.0,
                                    right: 10.0,
                                    top: 12.0),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 0.0, top: 10.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          doctorList[index + 2].doctorImage,
                                          fit: BoxFit.cover,
                                          width: 152.0,
                                          height: 145.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 9.0),
                                      child: Text(
                                        doctorList[index + 2].doctorName,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 1.0),
                                      child: Text(
                                        doctorList[index + 2].specialist,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 390,
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              doctorList.length < 2 ? doctorList.length : 2,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 188,
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 10.0 : 0.0,
                                    right: 10.0,
                                    top: 12.0),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 0.0, top: 10.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          doctorList[index + 4].doctorImage,
                                          fit: BoxFit.cover,
                                          width: 152.0,
                                          height: 145.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 9.0),
                                      child: Text(
                                        doctorList[index + 4].doctorName,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 1.0),
                                      child: Text(
                                        doctorList[index + 4].specialist,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 390,
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              doctorList.length < 2 ? doctorList.length : 2,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 188,
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 10.0 : 0.0,
                                    right: 10.0,
                                    top: 12.0),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 0.0, top: 10.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          doctorList[index + 6].doctorImage,
                                          fit: BoxFit.cover,
                                          width: 152.0,
                                          height: 145.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 9.0),
                                      child: Text(
                                        doctorList[index + 6].doctorName,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 1.0),
                                      child: Text(
                                        doctorList[index + 6].specialist,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
                Stack(
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.home_outlined,
                          size: 35,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
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
