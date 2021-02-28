import 'package:flutter/material.dart';
import 'package:sd012020/Components/rounded_billing_list_tile.dart';
import 'package:sd012020/Components/rounded_list_tile_visit.dart';
import 'package:sd012020/Components/service_list_tile.dart';
import 'package:sd012020/Models/Billing.dart';
import 'package:sd012020/Screens/billing_History_details.dart';
import 'package:sd012020/Screens/visit_details_page.dart';
import 'package:sd012020/Utilities/networking.dart';

class BillingHistoryMenu extends StatefulWidget {
  static String id = 'billing_history_page';

  @override
  _BillingListPageState createState() => _BillingListPageState();

}

Future<List<Billing>>getBillList() async{

  NetworkHelper networkHelper = NetworkHelper(url:'http://10.0.2.2:8082/INVENTORY_API/rest/api/serviceBill/Patient/03330000518');

  var jsonSet = await networkHelper.getData();
  print('\n\n\n\n'+jsonSet.toString());
  List<Billing> bills= [];
  Billing billing;

  for(var jsonobject in jsonSet){

    billing = Billing();

    billing.amount=jsonobject['totalAmount'];
    print(billing.amount);
    billing.invoicenumber= jsonobject['invoiceNumber'];
    billing.date=jsonobject['serviceBillItems'][0]['createdAt'];
    billing.date=billing.date.substring(0,10);
    billing.doctorname=jsonobject['doctorName'];
    billing.paidstatus=jsonobject['paidStatus'];
    billing.description=jsonobject['serviceBillItems'][0]['particulars'];
    print(billing.description);


   // billing.date='2222';
   //billing.amount='';
    bills.add(billing);
  }
  return bills;
}

class _BillingListPageState extends State<BillingHistoryMenu> {

  List<Billing> listbill =[];
  Billing billing= Billing();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delayfuc();

  }

  delayfuc() async{

    listbill = await getBillList();
    print('\n this place '+listbill.toString());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        title: Text(
          'Billing History Page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 244, 243),
        ),
        child: ListView(
            children: [
              for(Billing oneService in listbill)
                RoundedBillingListTile(date:oneService.date,invoiceNumber:oneService.invoicenumber,totalAmount:oneService.amount,doctorname:oneService.doctorname,paidstatus:oneService.paidstatus,description:oneService.description,onPressed: (){
                  Navigator.pushNamed(context, BillingHistoryDetailsPage.id,arguments: {'invoiceNumber':oneService.invoicenumber,'object':oneService})
                  ;
                  //Navigator.pushNamed(context, routeName);
                }),
            ]
        ),
      ),
    );
  }


}


