import 'package:flutter/material.dart';
import 'package:sd012020/Components/details_billing_tile.dart';
import 'package:sd012020/Components/large_navagation_button.dart';
import 'package:sd012020/Models/Billing.dart';
import 'package:sd012020/Screens/payment_bill_details.dart';
import 'package:sd012020/Screens/prescription_details.dart';
import 'package:sd012020/values.dart';

import 'doctor_details.dart';

class BillingHistoryDetailsPage extends StatelessWidget {
  static String id = 'BillingHistoryDetailsPage';



  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    String invoiceName = args['invoiceNumber'].toString();
    Billing object = args['object'];



    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 244, 243),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        title: Text(
          'Billing History Details Page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue),
      ),
      body: ListView(
        children: [
          Container(
            width: 385,
            height: 601,
            margin: EdgeInsets.only(top: 30, right: 10, left: 10),
            decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              border: Border.fromBorderSide(Borders.primaryBorder),
              boxShadow: [
                Shadows.primaryShadow,
              ],
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  height: 573,
                  margin: EdgeInsets.only(left: 17, top: 18),
                  child: ListView(
                    children: <Widget>[

                      DetailsBillingTile(
                        heading: 'Date',
                        data: object.date,
                      ),
                      DetailsBillingTile(
                        heading: 'Invoice No',
                        data: invoiceName,
                      ),
                      DetailsBillingTile(
                        heading: 'Doctor Name',
                        data: object.doctorname,
                      ),
                      DetailsBillingTile(
                        heading: 'Description',
                        data: object.description,
                      ),
                      DetailsBillingTile(
                        heading: 'Discount',
                        data: 'N/A',
                      ),
                      DetailsBillingTile(
                        heading: 'Paid Status',
                        data: object.paidstatus.toString(),
                      ),
                      DetailsBillingTile(
                        heading: 'Total Total',
                        data: object.amount.toString(),
                      )],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            width: 300,
            height: 52,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 66, 72),
              borderRadius: BorderRadius.all(Radius.circular(26)),
            ),
            child: LargeNavigationButton(
              color: Colors.blue,
              text: 'Pay',
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, PaymentBillingDetails.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
