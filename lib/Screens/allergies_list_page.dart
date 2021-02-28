import 'package:flutter/material.dart';
import 'package:sd012020/Components/rounded_list_tile_allergies.dart';
import 'package:sd012020/Components/rounded_list_tile_visit.dart';
import 'package:sd012020/Screens/allergy_details_page.dart';
import 'package:sd012020/Screens/visit_details_page.dart';

class AllergiesListPage extends StatelessWidget {
  static String id = 'Allergies_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        title: Text(
          'Allergy list page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 244, 243),
        ),
        child: ListView(
          children: <Widget>[
            RoundedAllergiesListTile(
              allergy: 'Fever',
              doctor: 'wasantha',
              onPressed: () {
                Navigator.pushNamed(context, AllergyDetailsPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
