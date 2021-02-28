import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sd012020/Models/Service.dart';
import 'package:sd012020/Screens/service_details.dart';
import 'package:sd012020/Utilities/networking.dart';
import 'package:sd012020/values.dart';
import 'package:sd012020/Components/service_list_tile.dart';

import '../Models/Service.dart';
import 'service_details.dart';

class ServicesListPage extends StatefulWidget {
  static String id = 'services_list_page';
  String name;

  @override
  _ServicesListPageState createState() => _ServicesListPageState();

}

class _ServicesListPageState extends State<ServicesListPage> {
  //String dropdownValue = 'Primary Care';
  String department = 'Consultant Fee';
  Service service= Service();
  List<Service> listservice =[];
  String searchBarValue;
  String searchBarValue1;
  String searchBarValue3;
  //String filterValue;
  List<Service> newListservice =[];
  List<Service> newListservice1 =[];
  List<Service> origianlListservice =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    delayfuc();
  }

  delayfuc() async{

    listservice = await getServiceList();
    origianlListservice = listservice;
    print('\n this place '+listservice.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 242, 244, 243),
        // title: Text(
        //   'Available Services',
        //   style: TextStyle(color: Colors.black),
        // ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xfffa4248)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 141,
                height: 106,
                margin: EdgeInsets.only(top: 10, bottom: 5),
                child: Image.asset(
                  "images/oo.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfffa4248), width: 3.0),
                ),
                hintText: 'Enter service name here..',
              ),
              onSubmitted:(value) async{
                searchBarValue = value.toLowerCase();
                searchBarValue1 = value.toUpperCase();
                searchBarValue3 = value;
                for(Service oneService in listservice)
                {
                  if(oneService.name.contains(searchBarValue) || oneService.name.contains(searchBarValue1) || oneService.name.contains(searchBarValue3)) {
                    newListservice.add(oneService);
                    break;
                  }
                }
                setState(() {
                  if(searchBarValue.length == 0)
                  {
                    listservice = origianlListservice;
                    newListservice.clear();
                  }
                  else
                    listservice = newListservice;
                });
              },
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(0,5,0,0),
              height: 58,
              margin: EdgeInsets.only(left: 24, top: 7, right: 18),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 8,
                    right: 0,
                     child: Container(
                         width: 165,
                         height: 48,
                         decoration: BoxDecoration(
                           border: Border.all(
                             width: 2,
                             color: Color(0xfffa4248),
                           ),
                         borderRadius: BorderRadius.all(Radius.circular(1)),
                        ),
                         child: FlatButton(
                           color: Colors.white,
                           textColor: Colors.black,
                           disabledColor: Colors.grey,
                           disabledTextColor: Colors.black12,
                           padding: EdgeInsets.all(8.0),
                           splashColor: Color(0xfffa4248),
                           onPressed: () {
                             setState(() {
                               listservice = origianlListservice;
                               newListservice.clear();
                               newListservice1.clear();
                             });
                           },
                           child: Text(
                             "RESET FILTERS",
                             style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),
                           ),
                         )
                     ),
                  ),
                  Positioned(
                    left: 0,
                    top: 8,
                    child: Container(
                      width: 180,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color(0xfffa4248),
                        border: Border.fromBorderSide(Borders.primaryBorder),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 25,),
                            child: DropdownButton<String>(
                              value: department,
                              dropdownColor: Color(0xfffa4248),
                              icon: Icon(Icons.arrow_downward, color: Colors.white),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                              underline: Container(
                                height: 0,
                                color: Colors.black,
                              ),
                              onChanged: (String newValue) {
                                department = newValue;
                                for(Service oneService in listservice)
                                {
                                  if(oneService.serviceType.contains(department)) {
                                    newListservice1.add(oneService);
                                  }
                                }
                                setState(() {
                                  //department = newValue;
                                  listservice = newListservice1;
                                });
                              },
                              items: <String>[
                                'Consultant Fee',
                                'Cardiologist',
                                'Technician',
                                'Final Price',
                                'Hospital Charge',
                                'ECG Technician'
                              ].map<DropdownMenuItem<String>>((String value1) {
                                return DropdownMenuItem<String>(
                                  value: value1,
                                  child: Text(value1),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                ],
              ),
            ),
            Container(
              height: 410,
              margin: EdgeInsets.only(left: 13, right: 5, top:8),
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListView(
                children: [
                  for(Service oneService in listservice)
                    ServiceListTile(text: oneService.name ,onPressed: (){
                      Navigator.pushNamed(context, ServiceDetailsPage.id,arguments: {'namee':oneService.name, 'object':oneService});
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Service>>getServiceList() async{

  NetworkHelper networkHelper = NetworkHelper(url:'http://10.0.2.2:8084/HIS_CHARGEMASTER_API/rest/Service');

  var jsonSet = await networkHelper.getData();
  print('\n\n\n\n'+jsonSet.toString());
  List<Service> services= [];
  Service service;

  for(var jsonobject in jsonSet){

    service = Service();

    service.id= jsonobject['id'];
    service.name=jsonobject['name'];
    service.price=jsonobject['serviceTypePrices'][0]['price'];
    service.serviceType=jsonobject['serviceTypePrices'][0]['serviceType']['name'];

    services.add(service);

  }

  return services;

}