import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sd012020/Components/large_navagation_button.dart';
import 'package:sd012020/Screens/main_menu.dart';

import '../values.dart';

void main() {
  runApp(ConfirmTheAppointemntWidget());
}

class ConfirmTheAppointemntWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
                child: new Text(
                  "Please enter the details to confirm the appointement ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Color(0xff000000),
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60.0,
              width: 350.0,
              margin: EdgeInsets.fromLTRB(0, 40, 30, 0),
              child: new TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  icon: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.black,
                  ),
                  labelText: 'Patient name',
                ),
              ),
            ),
            Container(
              height: 60.0,
              width: 350.0,
              margin: EdgeInsets.fromLTRB(0, 40, 30, 0),
              child: new TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  icon: const Icon(
                    Icons.perm_identity,
                    size: 40,
                    color: Colors.black,
                  ),
                  labelText: 'NIC',
                ),
              ),
            ),
            Container(
              height: 60.0,
              width: 350.0,
              margin: EdgeInsets.fromLTRB(0, 40, 30, 0),
              child: new TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  icon: const Icon(
                    Icons.phone,
                    size: 40,
                    color: Colors.black,
                  ),
                  labelText: 'Contact number',
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              height: 50.00,
              width: 230.00,
              margin: EdgeInsets.fromLTRB(20, 0, 30, 20),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  width: 1.00,
                  color: Color(0xff665eff),
                ),
                borderRadius: BorderRadius.circular(80.00),
              ),
              child: LargeNavigationButton(
                color: Color(0xff00bdc5),
                text: 'CONFIRM THE APPOINTEMENT',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
