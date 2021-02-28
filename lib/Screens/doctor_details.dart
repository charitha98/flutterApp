/*
*  exams_widget.dart
*
*
*  Created by .
*  Copyright © 2018 . All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:sd012020/Components/large_navagation_button.dart';
import 'package:sd012020/Screens/prescription_details.dart';
import 'package:sd012020/values.dart';
import 'package:sd012020/Components/details_tile.dart';

class DoctorDetailsPage extends StatelessWidget {
  static String id = 'doctors_details_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 244, 243),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        title: Text(
          'Doctor Page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue),
      ),
      body: ListView(
        children: [
          Container(
            width: 385,
            height: 601,
            margin: EdgeInsets.only(top: 30, right: 10, left: 10),
            decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              border: Border.fromBorderSide(Borders.primaryBorder),
              boxShadow: [
                Shadows.primaryShadow,
              ],
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 385,
                  height: 573,
                  margin: EdgeInsets.only(left: 3, top: 7),
                  child: ListView(
                    children: <Widget>[
                      DetailsTile(
                        heading: 'Name',
                        data: 'Wasanthe Fernando',
                      ),
                      DetailsTile(
                        heading: 'Designation',
                        data: 'Doctor',
                      ),
                      DetailsTile(
                        heading: 'Available',
                        data: 'Yes',
                      ),
                      DetailsTile(
                        heading: 'Availablility',
                        data: 'Busy',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
            width: 360,
            height: 52,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 66, 72),
              borderRadius: BorderRadius.all(Radius.circular(26)),
            ),
            child: LargeNavigationButton(
              color: Colors.blue,
              text: 'Schedule An Appointment',
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
