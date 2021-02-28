/*
*  exams_widget.dart
*
*
*  Created by .
*  Copyright © 2018 . All rights reserved.
    */
import 'package:flutter/material.dart';
import 'package:sd012020/Components/large_navagation_button.dart';
import 'package:sd012020/Screens/doctor_details.dart';
import 'package:sd012020/values.dart';
import 'package:sd012020/Components/details_tile.dart';
import 'package:sd012020/Components/detailed_drug_tile.dart';

class PrescriptionDetailsPage extends StatelessWidget {
  static String id = 'prescription_details_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 244, 243),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        title: Text(
          'Prescription Details',
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
                        heading: 'Prescription ID',
                        data: '19',
                      ),
                      DetailsTile(
                        heading: 'Complaint',
                        data: 'Fever',
                      ),
                      DetailsTile(
                        heading: 'Precribed Items',
                        data: '2',
                      ),
                      DetailsTile(
                        heading: 'Exam ID',
                        data: '3',
                      ),
                      for (int i = 1; i < 10; i++)
                        DetailedDrugTile(
                          drugNumber: '$i',
                          drugName: 'Paracetamol Tab. 500mg',
                          quantity: '36',
                          period: '4',
                          frequency: 't.d.s',
                          dosage: '3',
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
              text: 'Shedule Prescription',
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
