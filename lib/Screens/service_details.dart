/*
*  service_details_widget.dart
*  Hospital Service System
*/

import 'package:flutter/material.dart';
import 'package:sd012020/Components/service_details_tile.dart';
import 'package:sd012020/Models/Service.dart';

class ServiceDetailsPage extends StatelessWidget {
  static String id = 'ServiceDetailsPage';

  Service service= Service();
  String name;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    String name = args['namee'].toString();
    Service object = args['object'];

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
              height: 50,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.fromLTRB(20,0,20,0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                //margin: EdgeInsets.only(left: 18, top: 10),
                padding: EdgeInsets.fromLTRB(2,8,2,2),
                child: Text(
                  object.name,
                  //service.name
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontFamily: "Arial",
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Container(
              height: 400,
              padding: EdgeInsets.fromLTRB(10,0,10,0),
              child: ListView(
                children: <Widget>[
                  // ServiceDetailsTile(
                  //   label: 'ID                      :',
                  //   data: object.id.toString(),
                  // ),
                  ServiceDetailsTile(
                    label: 'Service Type   :',
                    data: object.serviceType,
                  ),

                  ServiceDetailsTile(
                    label: 'Price                 :',
                    data: object.price.toString(),
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