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

class VisitDetailsPage extends StatelessWidget {
  static String id = 'visit_detail_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 244, 243),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        title: Text(
          'Visit Details Page',
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
                        heading: 'Visit ID',
                        data: '19',
                      ),
                      DetailsTile(
                        heading: 'Complaint',
                        data: 'Fever',
                      ),
                      DetailsTile(
                        heading: 'Visit date',
                        data: '12/12/2020',
                      ),
                      DetailsTile(
                        heading: 'Doctor',
                        data: 'Wasanthe',
                      ),
                      DetailsTile(
                        heading: 'Diagnosis',
                        data: 'Fever',
                      ),
                      DetailsTile(
                        heading: 'Prescription ID',
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
              text: 'Prescription',
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, PrescriptionDetailsPage.id);
              },
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
              text: 'Doctor',
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
