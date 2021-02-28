import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sd012020/Components/toast.dart';
import 'package:sd012020/Models/Customer.dart';
import 'package:sd012020/Screens/HIN_verfication.dart';
import 'package:sd012020/Screens/verification_code_screen.dart';
import 'package:sd012020/Utilities/network_alerts.dart';
import 'package:sd012020/values.dart';
import 'package:sd012020/Controllers/verficationController.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart'; //For creating the SMTP Server

class HINVerification2 extends StatelessWidget {
  static String id = 'HINVerification2';
  var args;
  Customer customer;

  NetworkAlerts networkAlerts = NetworkAlerts();
  VerificationController verificationController = VerificationController();
  final _db = FirebaseFirestore.instance;
  String userInput;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    String choice = args['choice'];
    customer = args['customer'];

    networkAlerts.alertLockListener(context);  // network lock

    var hint;

    if(choice == 'email')
      {
        if(customer.email != '' || customer.email != null)
          {
            String email = customer.email;
            hint = email.replaceRange(4, email.length, '*' * (email.length-4));
          }
        else{
          toast('Your email is not registered. Please contact the hospital or choice a different method');
          Navigator.pop(context);
        }
      }
    else
      {
        if(choice == 'phoneNumber')
        {
          if(customer.phoneNumber!= '' || customer.phoneNumber != null)
          {
            String number= customer.phoneNumber;
            hint = number.replaceRange(0, number.length-4, '*' * (number.length-4));
          }
          else{
            toast('Your phoneNumber is not registered. Please contact the hospital or choice a different method');
            Navigator.pop(context);
          }
        }
      }


    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue),
        title: Text(
          'HIN Verification',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 242, 244, 243),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 656,
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Please enter the registered $choice $hint for validation.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "SF Pro Display",
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 358,
                        height: 285,
                        margin: EdgeInsets.only(top: 129),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 0,
                              child: Container(
                                width: 358,
                                height: 285,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBackground,
                                  border: Border.fromBorderSide(
                                      Borders.primaryBorder),
                                  boxShadow: [
                                    Shadows.primaryShadow,
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(28)),
                                ),
                                child: Container(),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      choice == "email"
                                          ? 'Email'
                                          : 'PhoneNumber',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 45, 224, 224),
                                        fontFamily: "SF Pro Display",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: 337,
                                      margin: EdgeInsets.only(top: 120),
                                      child: Column(
                                        children: [
                                             Container(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  hintText: choice=='phoneNumber'?'0761234567':'example@gmail.com',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                keyboardType: choice=='phoneNumber'?TextInputType.number:TextInputType.emailAddress,
                                                style: TextStyle(fontSize: 25),
                                                textAlign: TextAlign.center,
                                                maxLength: choice=='phoneNumber'?10:25,  // phone 10,email 25
                                                onSubmitted: (value){
                                                  userInput = value;
                                                },
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
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () async{
                        try {

                          if(choice == 'phoneNumber')
                          {

                            if(userInput.length<10)
                            {
                              toast('Enter a valid number');
                              return;
                            }

                          else{
                            // phone number
                              verificationController.phoneNumberVerfify(userInput, context);
                          }
                        }
                        else{   //email
                          print(choice);

                          if(!userInput.contains('@')){toast('Please enter a valid email');return;}

                          Random random = Random();
                          int code = random.nextInt(89999)+10000;

                          if(userInput.trim() == customer.email.trim()) {

                            var status = await verificationController.emailVerify(
                                email: customer.email.trim(),
                                verificationCode: code);

                            if(status==1){
                              toast('Email sent. check your email');
                              Navigator.pushNamed(context,VerificationCodeScreen.id,arguments:{'verificationCode':code});
                            }
                            else
                              {
                                toast('Failed to send the email. try again');
                              }

                          }
                          else
                            {
                              toast('Error: Email do not match');
                            }

                          }

                        } on MailerException catch (e) {

                          print(' HIN_verficationPage_except: Message not sent. \n'+ e.toString()); //print if the email is not sent
                          // e.toString() will show why the email is not sending

                        }
                        catch (e)
                        {
                          print("HIN_verficationPage_except : " + e.toString());
                        }
                        // Navigator.pushNamed(
                        //     (context), VerificationCodeScreen.id);
                      },
                      child: Container(
                        height: 110,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 110,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(26, 36, 36, 36),
                                      offset: Offset(0, -1),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  "images/bg-14.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              bottom: 45,
                              child: Container(
                                width: 146,
                                height: 51,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 189, 197),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "NEXT",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontFamily: "SF Pro Text",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
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

