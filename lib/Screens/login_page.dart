/*
*  login_widget.dart
*
*
*  Created by .
*  Copyright © 2018 . All rights reserved.
    */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sd012020/Components/toast.dart';
import 'package:sd012020/Screens/ProfileScreen.dart';
import 'package:sd012020/Screens/main_menu.dart';
import 'package:sd012020/Utilities/network_alerts.dart';
import 'package:sd012020/values.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email;
  var password;
  String resetPasswordString;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

  void _signInFacebook() async {

//    2407536649-ZFNGnaMhK7tCHBYL4rQ2SGT9nkuTbnL8g3aJCxq acc token
//    Niz5D73o0BaUMZU4GHHGCTSpJmIoxmoPIITPeuOH46SMO acc token secret

    FacebookLogin facebookLogin = FacebookLogin();

    final result = await facebookLogin.logIn(['email']);

    final token = result.accessToken.token;

    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name&access_token=${token}');

    print(graphResponse.body);

    if (result.status == FacebookLoginStatus.loggedIn) {

      final credential = FacebookAuthProvider.credential(token);

      _firebaseAuth.signInWithCredential(credential);

      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => MainMenu(),
        ),
      );


    }

  }

  Future<void> sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }


  Future<User> _signIn(BuildContext context) async {

    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign in'),
    ));

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser
        .authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userDetailsCredential = await _firebaseAuth.signInWithCredential(credential);
    User userDetails = userDetailsCredential.user;
    ProviderDetails providerInfo = new ProviderDetails(userDetails.uid);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
      userDetails.uid,
      userDetails.displayName,
      userDetails.photoURL,
      userDetails.email,
      providerData,
    );

    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => MainMenu(),
      ),
    );
    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    NetworkAlerts networkAlerts = NetworkAlerts();
    networkAlerts.alertLockListener(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text(
          'Login Page',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.lightBlue),
      ),
      body: Builder(
        builder: (context) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height,
            child: Image.network(
                'https://images.unsplash.com/photo-1518050947974-4be8c7469f0c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
                ,fit: BoxFit.fill,
                color: Color.fromRGBO(255, 255, 255, 0.6),
                colorBlendMode: BlendMode.modulate
            ),
          ),
          SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 164,
                    height: 128,
                    margin: EdgeInsets.only(top: 40),
                    child: Hero(
                      tag: 'FrontPage',
                      child: Image.asset(
                        "images/oo.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 360,
                    height: 66,
                    margin: EdgeInsets.only(top: 65),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        Container(
                          height: 40,
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
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 360,
                    height: 52,
                    margin: EdgeInsets.only(top: 31),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        Container(
                          height: 35,
                          child: TextField(
                            textInputAction: TextInputAction.done,
                            onSubmitted: (value) {
                              password = value.trim();
                            },
                            style: TextStyle(fontSize: 18),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    onPressed: () async {
                      //TODO:: create loading spinner in all loading instances
                      try {

                        if(email == null && password == null)
                          {
                            toast('Error: empty fields');
                            return;
                          }

                        //toast('');
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email,
                            password: password
                        );
                        Navigator.pushReplacementNamed(context, MainMenu.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          toast('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          toast('Wrong password provided for that user.');
                        }
                      }
                    },
                    child: Container(
                      width: 364,
                      height: 105,
                      margin: EdgeInsets.only(top: 23, right: 23, bottom: 14),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 53,
                            child: Container(
                              width: 360,
                              height: 52,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 250, 66, 72),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(26)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "LOGIN",
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
                          Positioned(
                            top: 0,
                            right: 0,
                            child: InkWell(
                              onTap: (){
                                Alert(
                                    context: context,
                                    title: "Password Reset",
                                    content: Column(
                                      children: <Widget>[
                                        Text("Please enter your registered email"),
                                        TextField(
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.account_circle),
                                            labelText: 'Email',
                                          ),
                                          onChanged: (value){
                                            resetPasswordString = value;
                                          },
                                        ),
                                      ],
                                    ),
                                    buttons: [
                                      DialogButton(
                                        onPressed: (){
                                          sendPasswordResetEmail(resetPasswordString);
                                          toast('Please check the email');
                                        },
                                        child: Text(
                                          "Continue",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                      )
                                    ]).show();
                              },
                              child: Text(
                                "Forgot Password?\n",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 2.28571,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 360,
                    height: 52,
                    margin: EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(Borders.secondaryBorder),
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          child: InkWell(
                            onTap:(){
                            _signInFacebook();
                            },
                            child: Text(
                              "Log In with Facebook",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
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
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 360,
                    height: 52,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(Borders.secondaryBorder),
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          child: InkWell(
                            onTap:() => _signIn(context)
                      .then((User user) => print(user))
                      .catchError((e) => print(e)),
                            child: Text(
                              "Log In with Google",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
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
                Container(
                  margin: EdgeInsets.only(left: 110, right: 110, bottom: 75),
                  child: Text(
                    "Do not have an account? Sign in",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 64, 64, 64),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    ],
      )
      ),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}