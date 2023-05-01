import 'package:flutter/material.dart';
import 'package:smart_hospital_mobile_app/appointment.dart';
import 'package:smart_hospital_mobile_app/register.dart';

import 'Api/historyApi.dart';
import 'main.dart';
import 'model/historymodel.dart';

class History extends StatefulWidget {
  final String mobile;

  const History({
    required this.mobile,
    Key? key,
  }) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  HistoryDataApi historyDataApi = new HistoryDataApi();

  List<Check> historyDataList = [];
  String mobileNumber = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Historydata empty = await historyDataApi.mobileNum(widget.mobile);
    setState(() {
      historyDataList = empty.check;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAF4FF),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 66),
            height: 40,
            width: 390,
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
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: historyDataList.length,
                itemBuilder: (context, index) {
                  final check = historyDataList[index];
                  return Container(
                    width: 392,
                    height: 63,
                    color: Colors.white,
                    child: ListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            check.name,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 200),
                            child: Text(
                              check.doctorName,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                check.specialist,
                              ),
                              margin: EdgeInsets.only(left: 0),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 140),
                              child: Text(
                                '${check.date.day}/${check.date.month}/${check.date.year}',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
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
                          size: 40,
                          color: Colors.black,
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
                  ],
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
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.blue,
                        width: 4.0,
                      ),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.list_alt,
                      size: 40,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Appointment()),
                      );
                    },
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 35,
                      color: Colors.black,
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
