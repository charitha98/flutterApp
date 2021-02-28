import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sd012020/Screens/HIN_page.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  changeRoute() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HINPage()),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    sleep(
//      Duration(seconds: 2),
//    );
    changeRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EEEF),
      body: Center(
        child: Image.asset('images/LogoGif.gif'),
//        child: SpinKitRotatingCircle(
//          color: Colors.white,
//          size: 50.0,
//        ),
      ),
    );
  }
}
