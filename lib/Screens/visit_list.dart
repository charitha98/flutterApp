import 'package:flutter/material.dart';
import 'package:sd012020/Components/rounded_list_tile_visit.dart';
import 'package:sd012020/Screens/visit_details_page.dart';

class VisitsPage extends StatelessWidget {
  static String id = 'visits_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        title: Text(
          'Visits',
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
            RoundedVisitListTile(
              date: '12/12/2020',
              allergy: "fever",
              onPressed: () {
                Navigator.pushNamed(context, VisitDetailsPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
