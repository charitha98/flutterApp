/*
*  sign_up_widget.dart
*
*
*  Created by .
*  Copyright © 2018 . All rights reserved.
    */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sd012020/Components/toast.dart';
import 'package:sd012020/Screens/login_page.dart';
import 'package:sd012020/Utilities/network_alerts.dart';
import 'package:sd012020/values.dart';

class SignUpPage extends StatelessWidget {
  static String id = 'SingUpPage';

  @override
  Widget build(BuildContext context) {

    FirebaseAuth _auth = FirebaseAuth.instance;
    String email,password,confirmationPassword;
    NetworkAlerts networkAlerts = NetworkAlerts();
    networkAlerts.alertLockListener(context);

    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    //TODO::create the google/face book login sys
    //TODO::upload user data 'customer object' to fire store

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.dark,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue),
        title: Text(
          'Sign Up Page',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 360,
                height: 66,
                margin: EdgeInsets.only(top: 159),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          "Email",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        onSubmitted: (value) {
                          email = value.trim();
                          FocusScope.of(context).nextFocus();
                        },
                        style: TextStyle(fontSize: 18),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'example@gmail.com',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                style: BorderStyle.solid,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 360,
                height: 52,
                margin: EdgeInsets.only(top: 41),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          "Password",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 170,
                        height: 8,
                        margin: EdgeInsets.only(top: 16),
                        child: Image.asset(
                          "assets/images/password-text.png",
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 5,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        onSubmitted: (value) {
                          password = value.trim();
                          FocusScope.of(context).nextFocus();
                        },
                        style: TextStyle(fontSize: 18),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 360,
                height: 52,
                margin: EdgeInsets.only(top: 41),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          "Confirm Password",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 5,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        onSubmitted: (value) {
                          confirmationPassword = value.trim();
                          if(value!=password){
                            toast('Confirmation password do not match with the password');
                            value = '';
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: TextStyle(fontSize: 18),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: ()async{
                    if(password != null && password == confirmationPassword) {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        if(userCredential != null) {
                          toast('Account created');
                          Navigator.pushNamed(context,LoginPage.id);
                        }
                         // navigator
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          toast('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          toast('The account already exists for this email.');
                        }
                      } catch (e) {
                        print('excepptotpn :: '+e.toString());
                      }

                    }
                    else if(password != confirmationPassword)
                    {
                      toast('Confirmation password do not match with the password !!');
                      return;
                    }else if(password == null)
                    {
                      toast('password can not be empty');
                      return;
                    }
                },
                child: Container(
                  width: 360,
                  height: 52,
                  margin: EdgeInsets.only(top: 140),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 189, 197),
                    borderRadius: BorderRadius.all(Radius.circular(26)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "SIGN UP",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            letterSpacing: 0.056,
                          ),
                        ),

                    ],
                  ),
                ),
              ),
              Container(
                width: 360,
                height: 52,
                margin: EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(Borders.secondaryBorder),
                  borderRadius: BorderRadius.all(Radius.circular(26)),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: Text(
                        "Sign Up with Facebook",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 31,
                      child: Image.asset(
                        "images/icon-facebook.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  try {
                    await _googleSignIn.signIn();
                  } catch (error) {
                    print(error);
                    toast('failed to log in');
                  }
                },
                child: Container(
                  width: 360,
                  height: 52,
                  margin: EdgeInsets.only(bottom: 140, top: 10),
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(Borders.secondaryBorder),
                    borderRadius: BorderRadius.all(Radius.circular(26)),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: Text(
                          "Sign Up with Google",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 31,
                        child: Image.asset(
                          "images/icons8-google-2.png",
                          fit: BoxFit.none,
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
    );
  }
}
