import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sd012020/Components/toast.dart';
import 'package:sd012020/Screens/signup_page.dart';
import 'package:sd012020/Utilities/network_alerts.dart';
import 'package:sd012020/values.dart';

class VerificationCodeScreen extends StatefulWidget {
  static String id = 'VerificationCodeScreen';
  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();


}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {

  NetworkAlerts networkAlerts = NetworkAlerts();
  var args;
  String firstDigit, secondDigit, thirdDigit, fourthDigit,fifthDigit;

  @override
  Widget build(BuildContext context) {

    networkAlerts.alertLockListener(context);
    args = ModalRoute.of(context).settings.arguments;
    int code = args['verificationCode'];


//    final page = ModalRoute.of(context); //change the status bar col to bark
//    page.didPush().then((x) {
//      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
//    });
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 242, 244, 243),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 8,
                    height: 14,
                    margin: EdgeInsets.only(left: 28, top: 74),
                    child: Image.asset(
                      "images/icon-left-3.png",
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 159,
                  height: 119,
                  child: Positioned(
                    top: 0,
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
                  width: 147,
                  margin: EdgeInsets.only(top: 42),
                  child: Text(
                    "Verification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      letterSpacing: -0.38571,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 220,
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    "A 5-Digit PIN has been sent to you\n. Enter it below to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 1.66667,
                    ),
                  ),
                ),
              ),
              Align(
                //1
                alignment: Alignment.topCenter,
                child: Container(
                  width: 340,
                  height: 53,
                  margin: EdgeInsets.only(top: 22),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        child: Row(
                          children: [
                            Align(
                              // 1
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 52,
                                height: 53,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryElement,
                                  border: Border.fromBorderSide(
                                      Borders.secondaryBorder),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                child: Container( //1
                                  child: TextField(
                                    maxLength: 1,
                                    textInputAction: TextInputAction.next,
                                    onChanged: (value) {
                                      print(firstDigit);
                                      firstDigit=value;
                                      print(firstDigit);
                                      FocusScope.of(context).nextFocus();
                                    },
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 23,
                                    ),
                                    cursorColor:
                                        Color.fromARGB(255, 0, 189, 197),
                                    decoration: InputDecoration(
                                      counterText: '',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
//                                      focusedBorder: UnderlineInputBorder(
//                                        borderSide: BorderSide(color: ),
//                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              //2
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 52,
                                height: 53,
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryElement,
                                  border: Border.fromBorderSide(
                                      Borders.secondaryBorder),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                child: Container( //2
                                  child: TextField(
                                      maxLength: 1,
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) {
                                        secondDigit = value;
                                        print(secondDigit);
                                        FocusScope.of(context).nextFocus();
                                      },
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                      cursorColor:
                                          Color.fromARGB(255, 0, 189, 197),
                                      decoration: InputDecoration(
                                        counterText: '',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
//                                      focusedBorder: UnderlineInputBorder(
//                                        borderSide: BorderSide(color: ),
//                                      ),
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            Align(
                              // 4
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 52,
                                height: 53,
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryElement,
                                  border: Border.fromBorderSide(
                                      Borders.secondaryBorder),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                child: Container(
                                  child: TextField( //5
                                      maxLength: 1,
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) {
                                        thirdDigit = value;
                                        print(thirdDigit);
                                        FocusScope.of(context).nextFocus();
                                      },
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                      cursorColor:
                                          Color.fromARGB(255, 0, 189, 197),
                                      decoration: InputDecoration(
                                        counterText: '',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
//                                      focusedBorder: UnderlineInputBorder(
//                                        borderSide: BorderSide(color: ),
//                                      ),
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 52,
                                height: 53,
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryElement,
                                  border: Border.fromBorderSide(
                                      Borders.secondaryBorder),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                child: Container( //4
                                  child: TextField(
                                      maxLength: 1,
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) {
                                        fourthDigit = value;
                                        print(fourthDigit);
                                        FocusScope.of(context).nextFocus();
                                      },
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                      cursorColor:
                                          Color.fromARGB(255, 0, 189, 197),
                                      decoration: InputDecoration(
                                        counterText: '',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
//                                      focusedBorder: UnderlineInputBorder(
//                                        borderSide: BorderSide(color: ),
//                                      ),
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 52,
                          height: 53,
                          decoration: BoxDecoration(
                            color: AppColors.primaryElement,
                            border:
                                Border.fromBorderSide(Borders.secondaryBorder),
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          child: Container( // 3
                            child: TextField(
                              onChanged: (value){
                                fifthDigit = value;
                                print(fifthDigit);
                              },
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                                cursorColor: Color.fromARGB(255, 0, 189, 197),
                                decoration: InputDecoration(
                                  counterText: '',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
//                                      focusedBorder: UnderlineInputBorder(
//                                        borderSide: BorderSide(color: ),
//                                      ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                )),
                          ),
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
                  margin: EdgeInsets.only(top: 257),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 189, 197),
                    borderRadius: BorderRadius.all(Radius.circular(26)),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      var userInput = firstDigit+secondDigit+thirdDigit+fourthDigit+fifthDigit;
                      print('final code:'+userInput);
                      if(userInput == code.toString()) {
                        toast('verified');
                        Navigator.pushNamed(context, SignUpPage.id);
                      }
                      else
                        {
                          toast('Invalid verification number');
                          Navigator.pop(context);
                        }
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "CONTINUE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              letterSpacing: 0.056,
                            ),
                          ),
                        ),
                      ],
                    ),
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
