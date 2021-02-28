/*
*  patient_history_menu_widget.dart
*
*
*  Created by .
*  Copyright © 2018 . All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:sd012020/Components/main_menu_card.dart';
import 'package:sd012020/Screens/allergies_list_page.dart';
import 'package:sd012020/Screens/visit_list.dart';
import 'package:sd012020/values.dart';

class PatientHistoryMenu extends StatelessWidget {
  static String id = 'patient_histrory_menu';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue),
        title: Text(
          'Patient History Page',
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
        child: ListView(
          children: [
            Container(
              width: 400,
              height: 200,
              margin: EdgeInsets.only(top: 10, right: 0),
              child: MainMenuCard(
                image: 'images/PaitentVisits.jpg',
                onClick: () {
                  Navigator.pushNamed(context, VisitsPage.id);
                },
                text: 'Visits',
                color: Color(0xFFE2F0FF),
              ),
            ),
            Container(
              width: 400,
              height: 200,
              margin: EdgeInsets.only(top: 10, right: 0),
              child: MainMenuCard(
                image: 'images/allergies.png',
                onClick: () {
                  Navigator.pushNamed(context, AllergiesListPage.id);
                },
                text: 'Allergies',
                color: Color.fromARGB(255, 237, 253, 171),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
