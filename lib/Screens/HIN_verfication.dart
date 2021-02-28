/*
*  hinverification_widget.dart
*
*
*  Created by .
*  Copyright © 2018 . All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:sd012020/Components/small_navigation_button.dart';
import 'package:sd012020/Models/Customer.dart';
import 'package:sd012020/Screens/HIN_verification_2.dart';
import 'package:sd012020/values.dart';

class HINVerification extends StatelessWidget {
  static String id = 'HIN_Verification_Screen';
  String choice;
  var arg;
  Customer customer;


  @override
  Widget build(BuildContext context) {
    arg = ModalRoute.of(context).settings.arguments;
    customer = arg['customer'];

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue),
        title: Text(
          'HIN Verfication',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 244, 243),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Please select a verification methode",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "SF Pro Display",
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: 343,
                child: FlatButton(
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      HINVerification2.id,
                      arguments: {'choice':'email','customer':customer},
                    );
                  },
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        left: 0,
                        top: 47,
                        right: 0,
                        child: Container(
                          height: 190,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 170, 235, 255),
                            border:
                                Border.fromBorderSide(Borders.primaryBorder),
                            boxShadow: [
                              Shadows.primaryShadow,
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(28)),
                          ),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(bottom: 10),
                            margin: EdgeInsets.only(left: 54),
                            child: Text(
                              "Email",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        bottom: 14,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 190,
                              decoration: BoxDecoration(
//                              border:
//                                  Border.fromBorderSide(Borders.primaryBorder),
//                              boxShadow: [
//                                Shadows.primaryShadow,
//                              ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'images/emailImg.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: 343,
                child: FlatButton(
                  splashColor: Colors.redAccent,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      HINVerification2.id,
                      arguments: {'choice':'phoneNumber','customer':customer},
                    );
                  },
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        left: 0,
                        top: 44,
                        right: 0,
                        child: Container(
                          height: 190,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 170, 170),
                            border:
                                Border.fromBorderSide(Borders.primaryBorder),
                            boxShadow: [
                              Shadows.primaryShadow,
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(28)),
                          ),
                          child: Container(),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        bottom: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                'images/PhoneImage.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: EdgeInsets.only(top: 15),
                                margin: EdgeInsets.only(left: 54),
                                child: Text(
                                  "Phone number",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 410,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(26, 36, 36, 36),
                              offset: Offset(0, -1),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          "images/bg-14.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 39,
                      child: SmallNavigationButton(
                        text: 'NEXT',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
