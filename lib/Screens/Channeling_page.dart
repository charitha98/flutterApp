import 'package:flutter/material.dart';
import 'package:sd012020/Components/large_navagation_button.dart';
import 'package:sd012020/Screens/Confirmation_page.dart';
import 'package:sd012020/values.dart';

void main() {
  runApp(Channeling());
}

class Channeling extends StatelessWidget {
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
            SizedBox(
              height: 30,
            ),
            Container(
              height: 160.0,
              width: 160.0,
              child: Image(
                image: AssetImage("images/doc.png"),
              ),
            ),
            Container(
                height: 60.0,
                width: 350.0,
                margin: EdgeInsets.fromLTRB(110, 10, 80, 20),
                child: new Text(
                  "Dr.Kamal Gamage",
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Color(0xff383838),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60.0,
              width: 350.0,
              //height: 37,
              margin: EdgeInsets.only(left: 1, right: 4),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 18),
                      child: Text(
                        "10.30 AM",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 56, 56, 56),
                          fontFamily: "SF Pro Display",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 250.00,
                    width: 82.00,
                    margin: EdgeInsets.fromLTRB(0, 0, 30, 20),
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
                      text: 'CHANNEL',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ConfirmTheAppointemntWidget()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 60.0,
              width: 350.0,
              //height: 37,
              margin: EdgeInsets.only(left: 1, right: 4),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 18),
                      child: Text(
                        "4.00 PM",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 56, 56, 56),
                          fontFamily: "SF Pro Display",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 250.00,
                    width: 82.00,
                    margin: EdgeInsets.fromLTRB(0, 0, 30, 20),
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
                      text: 'CHANNEL',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ConfirmTheAppointemntWidget()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 60.0,
              width: 350.0,
              //height: 37,
              margin: EdgeInsets.only(left: 1, right: 4),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 18),
                      child: Text(
                        "7.00 PM",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 56, 56, 56),
                          fontFamily: "SF Pro Display",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 250.00,
                    width: 82.00,
                    margin: EdgeInsets.fromLTRB(0, 0, 30, 20),
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
                      text: 'CHANNEL',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ConfirmTheAppointemntWidget()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ))),
    );
  }
}
