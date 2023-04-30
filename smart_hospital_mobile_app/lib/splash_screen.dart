import 'package:flutter/material.dart';

import 'main.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SmartHospital()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 440,
              ),
              child: Image.asset('images/Group 28.png'),
            ),
            Container(
              margin: EdgeInsets.only(top: 140),
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
            ),
          ],
        ),
      ),
    );
  }
}
