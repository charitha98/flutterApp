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

import 'doctor_details.dart';

class AllergyDetailsPage extends StatelessWidget {
  static String id = 'allergy_detail_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 244, 243),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        title: Text(
          'Allergy Details Page',
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
                        heading: 'Allergy Name',
                        data: '19',
                      ),
                      DetailsTile(
                        heading: 'Allergy remarks',
                        data: 'visit data',
                      ),
                      DetailsTile(
                        heading: 'discription',
                        data: 'adddedsd',
                      ),
                      DetailsTile(
                        heading: 'Doctor',
                        data: 'Wasanthe',
                      ),
                      DetailsTile(
                        heading: 'AllergySeverity',
                        data: 'Fever',
                      ),
                      DetailsTile(
                        heading: 'Diagnosed Hispital',
                        data: '13',
                      ),
                      DetailsTile(
                        heading: 'ExamActive',
                        data: 'True',
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
              text: 'Appointment',
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, DoctorDetailsPage.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
