/*
*  service_details_widget.dart
*  Hospital Service System
*/

import 'package:flutter/material.dart';
import 'package:sd012020/Models/Pharmacy.dart';
import 'package:sd012020/Components/drug_details_tile.dart';

class DrugDetailsPage extends StatelessWidget {
  static String id = 'DrugDetailsPage';

  Pharmacy service= Pharmacy();
  String name;
  String category;

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    String name = args['namee'].toString();
    Pharmacy object = args['object'];

    if(object.category == 'D'){
      category = 'Disease';
    }
    else if(object.category == 'V'){
      category = 'Vaccine';
    }
    else if(object.category == 'I'){
      category = 'Injection';
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 242, 244, 243),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xfffa4248)),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 244, 243),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 141,
                height: 106,
                margin: EdgeInsets.only(top: 10),
                child: Image.asset(
                  "images/oo.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.only(top: 30),
              // decoration: BoxDecoration(
              //   color: Colors.blue[100],
              // ),
              padding: EdgeInsets.fromLTRB(20,0,20,0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                //margin: EdgeInsets.only(left: 18, top: 10),
                padding: EdgeInsets.fromLTRB(2,15,2,2),
                child: Text(
                  object.name,
                  //service.name
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontFamily: "Arial",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              height: 400,
              padding: EdgeInsets.fromLTRB(10,0,10,0),
              child: ListView(
                children: <Widget>[
                  DrugDetailsTile(
                    label: 'Category               :',
                    data: category,
                  ),
                  DrugDetailsTile(
                    label: 'Danger Level        :',
                    data: object.dangerlevel.toString(),
                  ),
                  // DrugDetailsTile(
                  //   label: 'Product Code       :',
                  //   data: object.productCode,
                  // ),

                  DrugDetailsTile(
                    label: 'Product ID             :',
                    data: object.productId.toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
