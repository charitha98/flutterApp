import 'package:flutter/material.dart';
import 'package:sd012020/DB/DrugSchedule_DBHelper.dart';
import 'package:sd012020/Models/Drug.dart';
import 'package:sd012020/Screens/drug_shedulling.dart';
import 'package:sd012020/values.dart';


class SetDrugShedulePage extends StatelessWidget {
  static String id = 'set_drug_schedule_page' ;
  var drugName;
  var dosage;
  var amount;
  DBHelper dbHelper;

  @override
  Widget build(BuildContext context) {

    dbHelper = DBHelper();
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue),
        title: Text(
          'set drug schedule',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left:60, top: 65),
                        child: Text(
                          "Set Time",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 107, 109, 112),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
//                    Align(
//                      alignment: Alignment.topRight,
//                      child: Container(
//                        margin: EdgeInsets.only(left: 0, top: 65),
//                        child: Text(
//                          "SetDate",
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                            color: Color.fromARGB(255, 107, 109, 112),
//                            fontWeight: FontWeight.w400,
//                            fontSize: 18,
//                          ),
//                        ),
//                      ),
//                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 291,
                        height: 36,
                        margin: EdgeInsets.only(top: 21, right: 57),
                        child: Row(
                          children: [
                            Text(
                              "9.00AM",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 26, 26, 26),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:70),
                              child: Text(
                                "Everyday",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 26, 26, 26),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 360,
                        height: 94,
                        margin: EdgeInsets.only(top: 71),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Opacity(
                                opacity: 0.5,
                                child: Text(
                                  "Drug Name",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(top: 23),
                                child: TextField(
                                  onChanged: (input){
                                    drugName = input;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'drugName',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 2,
                              decoration: BoxDecoration(
                                border: Border.fromBorderSide(Borders.secondaryBorder),
                                borderRadius: Radii.k1pxRadius,
                              ),
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 360,
                        height: 94,
                        margin: EdgeInsets.only(top: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Opacity(
                                opacity: 0.5,
                                child: Text(
                                  "Dosage",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(top: 23),
                                child:  TextField(
                                  onChanged: (input){
                                    dosage = input;
                                  },
                                  decoration: InputDecoration(
                                    hintText: '10mg',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 2,
                              decoration: BoxDecoration(
                                border: Border.fromBorderSide(Borders.secondaryBorder),
                                borderRadius: Radii.k1pxRadius,
                              ),
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 360,
                        height: 93,
                        margin: EdgeInsets.only(top: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Opacity(
                                opacity: 0.5,
                                child:  Text(
                                  "Dosage",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(top: 24),
                                child:  TextField(
                                  onChanged: (input){
                                    amount=input;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'ex.1',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                border: Border.fromBorderSide(Borders.secondaryBorder),
                                borderRadius: BorderRadius.all(Radius.circular(0.5)),
                              ),
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      height: 52,
                      margin: EdgeInsets.only(left: 27, right: 40, bottom: 20,top:30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 168,
                              height: 52,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 250, 66, 72),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(26)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "CANCEL",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 23,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 168,
                              height: 52,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      width: 168,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 250, 66, 72),
                                        borderRadius: BorderRadius.all(Radius.circular(26)),
                                      ),
                                      child: Container(
                                        child: InkWell(
                                          onTap: () {

                                            print(amount);
                                            dbHelper.add(Drug(null,drugName,dosage,amount,0));
                                            Navigator.pushNamed(context,DrugSchedulingMainPage.id);

                                          },


                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 59,
                                    bottom: 11,
                                    child: Text(
                                      "SET",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}