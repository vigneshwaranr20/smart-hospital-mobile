import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext, BoxConstraints) {
          return Container(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 430,
                          height: 545,
                          child: Image.network(
                              'https://ethicadata.com/landing-page/static/a357a07b3a8748b4d6c6e7ff3ac30f8b/085d1/infectious-diseases-and-vaccines.webp'),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 486, bottom: 16),
                          width: 430,
                          height: 355,
                          child: Column(
                            children: [
                              Container(
                                width: 430,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 215,
                                      height: 48,
                                      color: Colors.cyan,
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
                                            color: Colors.cyan,
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
                                    top: 26, left: 20, right: 19),
                                color: Color(0xffEAF4FF),
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Mobile Number',
                                      labelStyle: TextStyle(
                                          backgroundColor: Colors.white)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 38, left: 20, right: 19),
                                width: 391,
                                height: 50,
                                color: Color(0xffEAF4FF),
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: ' Password',
                                      labelStyle: TextStyle(
                                          backgroundColor: Colors.white)),
                                ),
                              ),
                              Stack(
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
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
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
