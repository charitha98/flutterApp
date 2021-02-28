import 'dart:core';


import 'package:flutter/material.dart';
import 'package:sd012020/Controllers/DrugReminderController.dart';
import 'package:sd012020/DB/DrugSchedule_DBHelper.dart';
import 'package:sd012020/Models/Drug.dart';
import 'package:sd012020/Screens/set_drug_schedule.dart';
import 'package:sd012020/values.dart';
import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../values.dart';

class DrugSchedulingMainPage extends StatefulWidget {
  static String id = 'drug_scheduling_main_page';


  @override
  _DrugSchedulingMainPageState createState() => _DrugSchedulingMainPageState();
}

class _DrugSchedulingMainPageState extends State<DrugSchedulingMainPage> {

  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  List<Drug> drugs;
  Drug drug;
  String _drugName;
  bool isUpdate = false;
  int drugIdForUpdate;
  DBHelper dbHelper;
  final _drugNameController = TextEditingController();
  bool isChecked =false;

  FlutterLocalNotificationsPlugin fltrNotification;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    // Map<String,dynamic> map = {'1011':'name3','1012':'name2'};
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
    new InitializationSettings(androidInitilize, iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,onSelectNotification: notificationSelected);


    refreshDrugList();
  }



  refreshDrugList() async{

    drugs =  await dbHelper.getDrugs();
    print('*********** refresh function \n***********\n********\n*******'+drugs[0].toString());

    setState(() {



    });
  }


  @override
  Widget build(BuildContext context) {
    Time time = Time(15,36,00);
    NotificationManager notificationManager = NotificationManager();
    notificationManager.showNotificationDaily(01,"panadol","Take two pills",16,08);


    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SetDrugShedulePage.id);
            },
            child: Container(
              margin: EdgeInsets.only(top: 15, right: 19),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
        title: Text(
          'Drug schedule Page',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 20,
              child: Container(
                // main block
                width: 359,
                height: 474,
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  border: Border.all(
                    width: 0.6,
                    color: Color.fromARGB(255, 248, 248, 248),
                  ),
                  boxShadow: [
                    Shadows.secondaryShadow,
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
                child: Container(
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 36,
                          margin: EdgeInsets.only(
                              right: 22, top: 20, bottom: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Edit",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "9.00",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 26, 26, 26),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                ),
                              ),
                              Container(
                                width: 24,
                                margin: EdgeInsets.only(top: 1),
                                child: Opacity(
                                  opacity: 0.55,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column (
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for(Drug drug in drugs)
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                  onTap: (){
                                    print("pressed");
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible: false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('AlertDialog Title'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text('This is a demo alert dialog.'),
                                                Text('Would you like to approve of this message?'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('delete'),
                                              onLongPress: () {
                                                setState(() {
                                                  dbHelper.delete(drug);
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                            ),
                                            FlatButton(
                                              child: Text('cancel'),
                                              onPressed: () async {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );


                                  },
                                  child: DrugShedullingListTile(drug.drugName==null?'null':drug.drugName,drug.drugDosage,drug.drugPerTake==null?'null':drug.drugPerTake,true,drug)),

                            )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 293,
                          height: 22,
                          margin: EdgeInsets.only(top: 50, right: 23),
                          child: Row(
                            children: [
                              Text(
                                "Skip",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 89, 154, 240),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 29),
                                child: Text(
                                  "Snooze",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 103, 103, 103),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Done",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 241, 105, 105),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future notificationSelected(String payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Notification Clicked $payload"),
      ),
    );
  }

  Container DrugShedullingListTile(String drugName, String dosage, String take,bool status,Drug drg){
    return Container(
      width: double.infinity,
      height: 61,
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 15),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        border: Border.all(
          color: Color.fromARGB(255, 248, 248, 248),
        ),
        boxShadow: [
          Shadows.secondaryShadow,
        ],
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.accentElement,
                border: Border.all(
                  color: Colors.white,
                ),
                boxShadow: [
                  Shadows.primaryShadow,
                ],
                borderRadius: BorderRadius.all(Radius.circular(60)),
              ),
              child: Container(
                color: Colors.white,
                child: Positioned(
                  left: 0,
                  top: 6,
                  right: 22,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            drugName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 107, 109, 112),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 1,
                          height: 48,
                          margin: EdgeInsets.only(left: 66),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(159, 112, 112, 112),
                          ),
                          child: Container(),
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 17, right: 14),
                          child: Text(
                            dosage.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 107, 109, 112),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 1,
                          height: 48,
                          margin: EdgeInsets.only(right: 14),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(159, 112, 112, 112),
                          ),
                          child: Container(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 17, right: 13),
                          child: Text(
                            "Take "+take.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 107, 109, 112),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 1,
                          height: 48,
                          margin: EdgeInsets.only(top: 1, right: 20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(159, 112, 112, 112),
                          ),
                          child: Container(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChecked = isChecked ? false : true;

                            // dbHelper.updateDrugState(drug());

                          });
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: CustomSwitchButton(
                            backgroundColor: Colors.blueGrey,
                            unCheckedColor: Colors.white,
                            animationDuration: Duration(milliseconds: 400),
                            checkedColor: Colors.lightGreen,
                            checked:isChecked,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



}
