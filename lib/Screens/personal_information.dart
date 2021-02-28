/*
*  settings_widget.dart
*
*
*  Created by .
*  Copyright © 2018 . All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:sd012020/values.dart';

class PersonalInformationPage extends StatelessWidget {
  static String id = 'personal_information_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings Page'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 244, 243),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 642,
                margin: EdgeInsets.only(left: 10, top: 51, right: 6),
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                ),
                child: Column(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        leading: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.blue,
                        ),
                        title: Text(
                          'Name',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'John Doe',
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            PersonalInformationPage.id,
                          );
                        },
                      ),
                    ),
                  ],
                )),
            Spacer(),
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 18, 142, 234),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SAVE CHANGES",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: "Arial",
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
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
