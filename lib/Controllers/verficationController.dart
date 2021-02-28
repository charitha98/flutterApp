import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:sd012020/Components/toast.dart';
import 'package:sd012020/Screens/signup_page.dart';


class VerificationController{


  Future<bool> phoneNumberVerfify(String phone, BuildContext context) async{

    if(phone.length < 10 )
    {
      toast('Enter a valid phone number'); // -1 for wrong number
      return false;
    }

    phone = phone.trim();
    phone = phone.replaceRange(0,1,'+94');

    var tempcode;

    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          print('completed');
          // Navigator.of(context).pop();
          // UserCredential result = await _auth.signInWithCredential(credential);
          // User user = result.user;
          // if(user != null){
          //   Navigator.push(context, MaterialPageRoute(
          //       builder: (context) => HomeScreen(user: user,)
          //   ));
          // }else{
          //   print("Error");
          // }
          //This callback would gets called when verification is done auto maticlly

        },

        verificationFailed: (exception){

          print(exception);

        },

        codeSent: (String verificationId, [int forceResendingToken]){

          showDialog(

              context: context,

              barrierDismissible: false,

              builder: (context) {

                return AlertDialog(

                  title: Text("Type the code?"),

                  content: Column(

                    mainAxisSize: MainAxisSize.min,

                    children: <Widget>[

                      TextField(
                         keyboardType:TextInputType.number,
                         onChanged: (value){tempcode = value.trim();},

                      ),

                    ],

                  ),

                  actions: <Widget>[

                    FlatButton(

                      child: Text("Confirm"),

                      textColor: Colors.white,

                      color: Colors.blue,

                      onPressed: () async{

                        try {

                          AuthCredential credential = PhoneAuthProvider
                              .credential(
                              verificationId: verificationId, smsCode: tempcode);
                          print(credential);

                          UserCredential result = await _auth.signInWithCredential(credential);

                          User user = result.user;

                          if(user != null){

                            Navigator.pushNamed(context,SignUpPage.id);

                            user.delete();

                            print('user exist');
                          }else{

                            print("Error");

                          }

                        }
                        catch(e)
                        {
                          print("exception MY "+e.toString());
                          toast('Code did not match. Try again');
                          Navigator.pop(context);
                        }

                      },

                    )

                  ],

                );

              }

          );

        },

        codeAutoRetrievalTimeout: (error){
          print('codeAutoRetrievalTimeout');
        }

    );

  }


  Future<int> emailVerify({@required String email,@required int verificationCode}) async {

    try{
    // email

    // Creating the Gmail server
    String username = 'megapulzapp@gmail.com';//Your Email;
    String password = 'testingemail';//Your Email's password;


    final smtpServer = gmail(username, password);
    // Creating the Gmail server


    // Create our email message.
    print(verificationCode);
    final message = Message()

      ..from = Address(username)

      ..recipients.add(email) //recipient email

      ..subject = 'MegaPulz verification code ${DateTime.now()}' //subject of the email

      ..text = 'The verification code $verificationCode .'; //body of the email

    // email end


    final sendReport = await send(message, smtpServer);

    print('Message sent: ' + sendReport.toString()); //print if the email is sent

      return 1;

    } on MailerException catch (e) {

     print(' HIN_verficationPageController_except: Message not sent. \n'+ e.toString()); //print if the email is not sent
    // e.toString() will show why the email is not sending
      return -2;
    }
     catch (e)
    {
    print("HIN_verficationPageController_except : " + e.toString());
     return -1;
    }


  }


}

// references
// Sending Emails using Flutter https://medium.com/@achinthaisuru444/sending-emails-using-flutter-f588387280db