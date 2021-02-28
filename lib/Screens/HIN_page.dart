/*
*  hinpage_widget.dart
*
*  Page handles user HIN entries and communicates to the UserSingUpController. Also Gives access to the login interface.
*
*  Created by Namal Pathirana 20207755.
*  Copyright © 2018 . All rights reserved.
    */

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sd012020/Components/large_navagation_button.dart';
import 'package:sd012020/Controllers/UserSignUpController.dart';
import 'package:sd012020/Models/Customer.dart';
import 'package:sd012020/Screens/HIN_verfication.dart';
import 'package:sd012020/Screens/login_page.dart';
import 'package:sd012020/values.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:sd012020/values.dart';
import 'package:sd012020/Utilities/network_alerts.dart';

class HINPage extends StatefulWidget {
  static String id = 'mainPage';

  @override
  _HINPageState createState() => _HINPageState();
}

class _HINPageState extends State<HINPage> {
  UserSignUpController userController = UserSignUpController();
  int HINNumber;
  var spinner;
  var subscription;
  NetworkAlerts networkAlerts = NetworkAlerts();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    spinner = null;
    networkAlerts.alertLockPromptActive = false;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Auto connectivity check !
      if (result == ConnectivityResult.none) {
        print("before activation, state of prompt:  " +
            networkAlerts.alertLockPromptActive.toString());
        Future.delayed(Duration.zero, () {
          networkAlerts.alertLockPrompt(context);
        });
        print("After activation, state of prompt:  " +
            networkAlerts.alertLockPromptActive.toString());
      }
    });
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  } // end dispose

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 185,
                height: 134,
                margin: EdgeInsets.only(top: 51, right: 105, left: 105),
                child: Hero(
                  tag: 'FrontPage',
                  child: Image.asset(
                    "images/oo.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: 232,
                height: 70,
                margin: EdgeInsets.only(top: 73, right: 91, left: 91),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 122,
                        child: Text(
                          "Welcome ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            letterSpacing: -0.384,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Sign up and experience the services your hospital provides.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 276,
                height: 66,
                margin: EdgeInsets.only(top: 100, right: 69),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 276,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 28,
                                height: 18,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Text(
                                          "HIN",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 45,
                                child: TextField(
                                  onSubmitted: (enteredHINNumber) {
                                    HINNumber = int.parse(enteredHINNumber);
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLength: 6,
                                  style: TextStyle(fontSize: 25),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: '000000',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 45),
                height: 60,
                child: spinner,
              ),
              Container(
                width: 360,
                height: 52,
                margin: EdgeInsets.only(right: 23, bottom: 17, top: 35),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 250, 66, 72),
                  borderRadius: BorderRadius.all(Radius.circular(26)),
                ),
                child: LargeNavigationButton(
                  text: 'SIGNUP',
                  onPressed: () async {
                    setState(() {
                      spinner = SpinKitWave(
                        itemCount: 7,
                        color: Colors.red,
                        size: 60.0,
                      );
                    });

                    await userController.getCustomer(context, HINNumber); // async function that takes time to return
                  //  return is ignored since controller handles the operation.
                    setState(() {
                      // solution for spinner
                      spinner = null;
                    });
                  },
                ),
              ),
              Container(
                width: 360,
                height: 52,
                margin: EdgeInsets.only(right: 23, bottom: 126),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: LargeNavigationButton(
                        text: 'LOGIN',
                        onPressed: () {
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//class HINPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        decoration: BoxDecoration(
//          color: Color.fromARGB(255, 255, 255, 255),
//        ),
//        child: Padding(
//          padding: EdgeInsets.symmetric(horizontal: 30),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: [
//              Expanded(
//                flex: 8,
//                child: Container(
//                  margin: EdgeInsets.only(top: 70, bottom: 20),
//                  alignment: Alignment.center,
//                  child: Stack(
//                    alignment: Alignment.center,
//                    children: [
//                      Image.asset(
//                        "images/oo.png",
//                        fit: BoxFit.fill,
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Expanded(
//                flex: 6,
//                child: Container(
//                  width: double.infinity,
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      Align(
//                        alignment: Alignment.topCenter,
//                        child: Container(
//                          width: double.infinity,
//                          child: Text(
//                            "Welcome ",
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                              color: AppColors.primaryText,
//                              fontFamily: "Montserrat",
//                              fontWeight: FontWeight.w700,
//                              fontSize: 24,
//                              letterSpacing: -0.384,
//                            ),
//                          ),
//                        ),
//                      ),
//                      Text(
//                        "Sign up and experience the services \n your hospital provides.",
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          color: AppColors.secondaryText,
//                          fontFamily: "Montserrat",
//                          fontWeight: FontWeight.w400,
//                          fontSize: 12,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Expanded(
//                flex: 10,
//                child: Align(
//                  alignment: Alignment.topCenter,
//                  child: Container(
//                    width: double.infinity,
//                    margin: EdgeInsets.only(top: 30),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.stretch,
//                      children: [
//                        Expanded(
//                          flex: 3,
//                          child: Container(
//                            width: double.infinity,
//                            child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.stretch,
//                              children: [
//                                Align(
//                                  alignment: Alignment.topLeft,
//                                  child: Container(
//                                    width: double.infinity,
//                                    height: 18,
//                                    child: Stack(
//                                      alignment: Alignment.center,
//                                      children: [
//                                        Positioned(
//                                          left: 0,
//                                          top: 0,
//                                          child: Opacity(
//                                            opacity: 0.5,
//                                            child: Text(
//                                              "HIN",
//                                              textAlign: TextAlign.left,
//                                              style: TextStyle(
//                                                color: AppColors.primaryText,
//                                                fontFamily: "Montserrat",
//                                                fontWeight: FontWeight.w400,
//                                                fontSize: 18,
//                                              ),
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ),
//                                Align(
//                                  alignment: Alignment.topCenter,
//                                  child: TextField(
//                                    style: TextStyle(fontSize: 20),
//                                    textAlign: TextAlign.center,
//                                    decoration: InputDecoration(
//                                      hintText: '0000000',
//                                      enabledBorder: UnderlineInputBorder(
//                                        borderSide: BorderSide(
//                                          color: Colors.red,
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//              SizedBox(
//                height: 10,
//              ),
//              Expanded(
//                flex: 2,
//                child: LargeNavigationButton(
//                  text: 'SIGNUP',
//                  onPressed: () {
//                    Navigator.pushNamed(context, HINVerification.id);
//                  },
//                ),
//              ),
//              SizedBox(
//                height: 15,
//              ),
//              Expanded(
//                flex: 2,
//                child: LargeNavigationButton(
//                  text: 'LOGIN',
//                  onPressed: () {
//                    Navigator.pushNamed(context, HINVerification.id);
//                  },
//                ),
//              ),
//              SizedBox(
//                height: 50,
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
