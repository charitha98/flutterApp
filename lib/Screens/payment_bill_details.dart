import 'package:flutter/material.dart';
import 'package:sd012020/Components/large_navagation_button.dart';
import 'package:sd012020/Components/small_navigation_button.dart';
import 'package:sd012020/Screens/paypal_interface.dart';
import 'package:sd012020/Screens/prescription_details.dart';
import 'package:sd012020/values.dart';
import 'package:sd012020/Components/details_tile.dart';

import 'doctor_details.dart';

class PaymentBillingDetails extends StatelessWidget {
  static String id = 'PaymentBillingDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 244, 243),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        title: Text(
          'Payment Confirmation',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue),
      ),
      body: ListView(
        children: [
          Container(
            width: 385,
            height: 225,
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
                  width: 385,
                  margin: EdgeInsets.only(left: 3, top: 7),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        PaymentContainerRow(
                          label: 'Doctor',
                          data: 'Dr. Namal Wijesinghe',
                        ),
                        PaymentContainerRow(
                          label: 'Specification',
                          data: 'Cardiology',
                        ),
                        PaymentContainerRow(
                          label: 'App. Date',
                          data: '12/05/2020',
                        ),
                        PaymentContainerRow(
                          label: 'App. No',
                          data: '05',
                        ),
                        PaymentContainerRow(
                          label: 'Arrival Time',
                          data: '16:30 PM',
                        ),
                        PaymentContainerRow(
                          label: 'Your Time',
                          data: '17:20 PM',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 385,
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
                  width: 385,
                  margin: EdgeInsets.only(left: 3, top: 7),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        PaymentContainerRow(
                          label: 'Patient',
                          data: 'John Doe',
                        ),
                        PaymentContainerRow(
                          label: 'NIC/Passport',
                          data: '123456789V',
                        ),
                        PaymentContainerRow(
                          label: 'Contact No',
                          data: '077 1234567',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 385,
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
                  width: 385,
                  margin: EdgeInsets.only(left: 3, top: 7),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        PaymentContainerRow(
                          label: 'Doctor Fee ',
                          data: 'LRK 2,000.00',
                        ),
                        PaymentContainerRow(
                          label: 'Hospital Fee',
                          data: 'LKR 500.00',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        PaymentContainerRow(
                          label: 'Total Fee',
                          data: 'LKR 2,500.00',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 80),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 5, top: 15, bottom: 25),
                    width: 120,
                    height: 45,
                    child: SmallNavigationButton(
                      text: 'Cancel',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 15, bottom: 25),
                    width: 180,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFF00BDC5),
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                    ),
                    child: LargeNavigationButton(
                      color: Color(0xFF00BDC5),
                      text: 'Proceed',
                      textColor: Colors.white,
                      onPressed: () {
                        //Navigator.pushNamed(context, PayPalInterface);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentContainerRow extends StatelessWidget {
  final label;
  final data;

  const PaymentContainerRow({Key key, this.label, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Text(
              label == null ? 'null' : label,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF0707070),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ':',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF0707070),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Text(
              data == null ? 'null' : data,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
