import 'package:flutter/material.dart';
import 'package:sd012020/values.dart';
import 'package:sd012020/Components/drug_list_tile.dart';
import 'package:sd012020/Screens/drug_details.dart';
import 'package:sd012020/Utilities/networking.dart';
import 'package:sd012020/Models/Pharmacy.dart';

class PharmacyDrugList extends StatefulWidget {
  static String id = 'PharmacyDrugList';

  @override
  _PharmacyDrugListState createState() => _PharmacyDrugListState();
}

class _PharmacyDrugListState extends State<PharmacyDrugList> {
  String drug = 'Disease';
  String category;
  Pharmacy service= Pharmacy();
  List<Pharmacy> listservice1 =[];
  String searchBarValue;
  String searchBarValue1;
  List<Pharmacy> newListservice =[];
  List<Pharmacy> newListservice1 =[];
  List<Pharmacy> origianlListservice =[];

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    delayfuc();

  }


  delayfuc() async {
    listservice1 = await getServiceList();
    origianlListservice = listservice1;
    print('\n this place ' + listservice1.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 242, 244, 243),
        // title: Text(
        //   'Drug List',
        //   style: TextStyle(color: Colors.black),
        // ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xfffa4248)),
      ),
      body: SingleChildScrollView(
        // constraints: BoxConstraints.expand(),
        // decoration: BoxDecoration(
        //   color: Color.fromARGB(255, 255, 255, 255),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                for(Pharmacy oneService in listservice1)
                {
                  if(oneService.name.contains(searchBarValue) || oneService.name.contains(searchBarValue1)) {
                    newListservice.add(oneService);
                    break;
                  }
                }
                setState(() {
                  if(searchBarValue.length == 0)
                  {
                    listservice1 = origianlListservice;
                    newListservice.clear();
                  }
                  else
                    listservice1 = newListservice;
                });
              },
            ),
            Container(
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
                              listservice1 = origianlListservice;
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
                            margin: EdgeInsets.only(left: 50,),
                            child: DropdownButton<String>(
                              value: drug,
                              dropdownColor: Color(0xfffa4248),
                              icon: Icon(Icons.arrow_downward, color: Colors.white),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
                              underline: Container(
                                height: 0,
                                color: Colors.black,
                              ),
                              onChanged: (String newValue) {
                                drug = newValue;

                                if(drug == 'Disease'){
                                  category = 'D';
                                }
                                else if(drug == 'Vaccine'){
                                  category = 'V';
                                }
                                else if(drug == 'Injection'){
                                  category = 'I';
                                }

                                for (Pharmacy oneService in listservice1)
                                {
                                  if (oneService.category.contains(category)) {
                                    newListservice1.add(oneService);
                                    //break;
                                  }
                                }
                                setState(() {
                                  //department = newValue;
                                  listservice1 = newListservice1;
                                });
                                },
                              items: <String>[
                                'Disease',
                                'Vaccine',
                                'Injection',
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
              margin: EdgeInsets.only(left: 13, right: 5, top: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListView(
                children: [
                  for(Pharmacy oneService in listservice1)
                  DrugListTile(text: oneService.name ,onPressed: (){
                    Navigator.pushNamed(context, DrugDetailsPage.id,arguments: {'name':oneService.name, 'object':oneService});
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

Future<List<Pharmacy>>getServiceList() async{

  NetworkHelper networkHelper = NetworkHelper(url:'http://10.0.2.2:8082/INVENTORY_API/rest/api/products');

  var jsonSet = await networkHelper.getData();
  print('\n\n\n\n'+jsonSet.toString());
  List<Pharmacy> services= [];
  Pharmacy pharmacy;

  for(var jsonobject in jsonSet){

    pharmacy = Pharmacy();

    pharmacy.id= jsonobject['id'];
    pharmacy.productCode= jsonobject['productCode'];
    pharmacy.productId= jsonobject['productId'];
    pharmacy.dangerlevel= jsonobject['dangerLevel'];
    pharmacy.name=jsonobject['proname'];
    pharmacy.price=jsonobject['price'];
    pharmacy.category=jsonobject['category'];

    services.add(pharmacy);

  }

  return services;


}
