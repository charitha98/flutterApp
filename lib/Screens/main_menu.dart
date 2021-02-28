/*
*  main_widget.dart
*
*
*  Created by .
*  Copyright © 2018 . All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:sd012020/Components/main_menu_card.dart';
import 'package:sd012020/Screens/Searchdoctor_page.dart';
import 'package:sd012020/Screens/billing_history_menu.dart';
import 'package:sd012020/Screens/patient_history.dart';
import 'package:sd012020/Screens/pharmacy_drug_list.dart';
import 'package:sd012020/Screens/service_details.dart';
import 'package:sd012020/Screens/services_list.dart';
import 'package:sd012020/values.dart';
import 'settings_page.dart';
import 'package:sd012020/Screens/drug_shedulling.dart';

class MainMenu extends StatelessWidget {
  static String id = 'main_menu';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(237, 237, 237, 243),
        ),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 99,
              margin: EdgeInsets.only(top: 29),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 132,
                      height: 99,
                      margin: EdgeInsets.only(right: 35, left: 127),
                      child: Hero(
                        tag: 'FrontPage',
                        child: Image.asset(
                          "images/oo.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: FlatButton(
                      splashColor: Colors.purple[200],
                      onPressed: () {
                        Navigator.pushNamed(context, SettingsPage.id);
                      },
                      child: Container(
                        width: 29,
                        height: 24,
                        margin: EdgeInsets.only(right: 0, bottom: 30),
                        child: Icon(
                          Icons.list,
                          size: 55,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MainMenuCard(
              text: "Appointment System",
              image: "images/appointmentImage.jpg",
              color: AppColors.ternaryBackground,
              onClick: () {
                Navigator.pushNamed(context, Searchdoctor.id);
              },
            ),
            MainMenuCard(
              text: "Billing System",
              image: "images/billingSystem.png",
              color: Color(0xFFE2F0FF),
              onClick: () {
                Navigator.pushNamed(context, BillingHistoryMenu.id);
              },
            ),
            MainMenuCard(
              text: " Patient History ",
              image: "images/patientSystem.png",
              color: Color(0xFF8AC7B5),
              onClick: () {
                Navigator.pushNamed(context, PatientHistoryMenu.id);
              },
            ),
            MainMenuCard(
              text: "Hospital Service System",
              image: "images/HospitalServiceSys.jpg",
              color: Color(0xFFF8C4EE),
              onClick: () {
                Navigator.pushNamed(context, ServicesListPage.id);
              },
            ),
            MainMenuCard(
              text: "Drug Scheduler",
              image: "images/drug_sheduler_menu_pic.jpg",
              color: Color(0xFFAFFFF6),
              onClick: () {
                Navigator.pushNamed(context, DrugSchedulingMainPage.id);
              },
            ),
            MainMenuCard(
              text: "Pharmacy Service Sys",
              image: "images/pharmacy.jpeg",
              color: Color(0xFF8ce0ff),
              onClick: () {
                Navigator.pushNamed(context, PharmacyDrugList.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
