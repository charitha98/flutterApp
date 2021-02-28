import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sd012020/Components/large_navagation_button.dart';
import 'package:sd012020/Screens/Channeling_page.dart';
import 'package:sd012020/Screens/Confirmation_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(Searchdoctor());
}

class Searchdoctor extends StatefulWidget {
  static String id = 'Searchdoctorscreen';
  String choice;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Searchdoctor> {
  String _mySelection;
  DateTime date = DateTime.now();

  var selecteddate = '2020-09-18';

  Future<Null> selectDate(BuildContext) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2021),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        final DateTime now = date;
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formatted = formatter.format(now);
        print(formatted);
        selecteddate = formatted;

        //   print(data.toString());
      });
    }
  }

  final String url = "http://10.0.2.2:8084/HIS_CHARGEMASTER_API/rest/Doctor";
  final String url2 =
      "http://10.0.2.2:8084/HIS_CHARGEMASTER_API/rest/Speciality";

  List data = List();

  Future<String> getSWData() async {
    String username = 'his';
    String password = 'his12345';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var res = await http.get(Uri.encodeFull(url),
        headers: {"X-tenantID": "0333", 'authorization': basicAuth});
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody;
    });

    print(resBody);

    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var docname;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 40.0,
              width: 350.0,
              margin: EdgeInsets.fromLTRB(40, 30, 30, 0),
              child: new Text(
                "Channel Your Doctor",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              height: 140.0,
              width: 140.0,
              margin: EdgeInsets.fromLTRB(100, 10, 80, 0),
              child: Image(
                image: AssetImage("images/oo.png"),
              ),
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
                      margin: EdgeInsets.only(top: 0),
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  //Spacer(),
                  Container(
                    height: 250.00,
                    width: 102.00,
                    margin: EdgeInsets.fromLTRB(0, 25, 30, 0),
                    child: new Text(
                      "Doctor name",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60.0,
              width: 350.0,
              margin: EdgeInsets.fromLTRB(40, 0, 30, 0),
              child: new DropdownButton(
                items: data.map((item) {
                  return new DropdownMenuItem(
                    child: new Text(item['name']),
                    value: item['id'].toString(),
                  );
                }).toList(),
                onChanged: (newVal) {
                  setState(() {
                    _mySelection = newVal.toString();
                    // docname='dilshan';
                    print(_mySelection);
                  });
                },
                value: _mySelection,
              ),
            ),
            Container(
              height: 60.0,
              width: 350.0,
              //height: 37,
              margin: EdgeInsets.only(left: 1, right: 4, top: 15),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      child: IconButton(
                        icon: Icon(
                          Icons.assignment,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  //Spacer(),
                  Container(
                    height: 250.00,
                    width: 102.00,
                    margin: EdgeInsets.fromLTRB(0, 25, 30, 0),
                    child: new Text(
                      "Specialization",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60.0,
              width: 350.0,
              margin: EdgeInsets.fromLTRB(40, 0, 30, 0),
              child: new DropdownButton(
                items: data.map((item) {
                  return new DropdownMenuItem(
                    child: new Text(item['speciality']['name']),
                    value: item['id'].toString(),
                  );
                }).toList(),
                onChanged: (newVal) {
                  setState(() {
                    _mySelection = newVal.toString();
                    print(_mySelection);
                  });
                },
                value: _mySelection,
              ),
            ),
            Container(
              height: 60.0,
              width: 350.0,
              //height: 37,
              margin: EdgeInsets.only(left: 1, right: 4, top: 15),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      child: IconButton(
                          icon: Icon(
                            Icons.date_range,
                            size: 40,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            selectDate(BuildContext);
                          }),
                    ),
                  ),
                  //Spacer(),
                  Container(
                    height: 250.00,
                    width: 102.00,
                    margin: EdgeInsets.fromLTRB(0, 25, 30, 0),
                    child: new Text(
                      "Date",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 10),
            Container(
              height: 60.00,
              width: 100.00,
              margin: EdgeInsets.fromLTRB(0, 5, 220, 0),
              child: new Text(
                "$selecteddate",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ),
            Container(
              height: 50.00,
              width: 252.00,
              margin: EdgeInsets.fromLTRB(40, 10, 30, 0),
              decoration: BoxDecoration(
                color: Color(0xfffa4248),
                border: Border.all(
                  width: 1.00,
                  color: Color(0xff665eff),
                ),
                borderRadius: BorderRadius.circular(80.00),
              ),
              child: LargeNavigationButton(
                text: 'ENTER',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new Channeling()),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ))),
    );
  }
}
