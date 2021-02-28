import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sd012020/Components/toast.dart';
import 'package:sd012020/Models/Customer.dart';
import 'package:sd012020/Screens/HIN_verfication.dart';
import 'package:sd012020/Utilities/networking.dart';


class  UserSignUpController{

  Customer customer= Customer();

  NetworkHelper networkHelper = NetworkHelper(url: 'http://10.0.2.2:8082/INVENTORY_API/rest/api/Customers/getAll');

  Future<Customer> getCustomer(BuildContext context,int hin) async {

    try {

    var jsonSet = await networkHelper.getData().timeout(const Duration(seconds: 15)); // json reply , 15 second time out is active

    if (hin == 0 || hin
        .toString()
        .length < 6) {
      Alert(
        context: context,
        type: AlertType.error,
        title: hin == null ? "HIN FIELD EMPTY" : "INVALID HIN",
        desc: "Please enter a HIN Number",
        buttons: [
          DialogButton(
            color: Colors.grey,
            child: Text(
              "CLOSE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      return null;
    } // empty field check end


    for (var jsonObject in jsonSet) { // check if HIN exist and Create customer objects
      if (int.parse(jsonObject['clientID']) == hin) //if HIN exist
          {
        customer.id = jsonObject['id'];
        customer.name = jsonObject['name'];
        customer.email = jsonObject['email'];
        customer.clientID = jsonObject['clientID'];
        customer.phoneNumber = jsonObject['phone'];
        customer.account_No = jsonObject['account_No'];
        customer.createdDate = jsonObject['createdAt'];
        customer.updatedAt = jsonObject['updatedAt'];

        Navigator.pushNamed(context,HINVerification.id,arguments: {'customer':customer});

        return null;
      } // if end

    }

    Alert(                                     // if HIN doesn't exist
      context: context,
      type: AlertType.error,
      title: "HIN DO NOT EXIST",
      desc: "Please enter a valid HIN",
      buttons: [
        DialogButton(
          color: Colors.grey,
          child: Text(
            "CLOSE",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();

    }on SocketException catch(e)
    {
      print('UserSingUpController  SocketException error : '+e.toString());
      toast('SocketException');
    } catch(e)
    {
      print('UserSingUpController error : '+e.toString());
      toast('Server Timeout. Try again');
    }

  }



}