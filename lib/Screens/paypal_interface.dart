import 'package:flutter/material.dart';
import 'package:sd012020/values.dart';

class PayPalInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 160,
                margin: EdgeInsets.only(top: 40),
                child: Image.asset(
                  "images/oo.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 376,
                height: 86,
                margin: EdgeInsets.only(top: 76, right: 21),
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 14),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'example@gmail.com',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.only(left: 18, top: 43, right: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 1),
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
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 8,
                      margin: EdgeInsets.only(left: 1, top: 30),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '***********',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 153,
                height: 23,
                margin: EdgeInsets.only(left: 17, top: 49),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 25,
                        height: 23,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.fromBorderSide(Borders.primaryBorder),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Container(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 9, top: 1),
                        child: Text(
                          "Stay logged in ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 53,
              margin: EdgeInsets.only(left: 19, top: 49, right: 18),
              decoration: BoxDecoration(
                color: AppColors.secondaryElement,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Log In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.accentText,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      letterSpacing: 0.072,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 18,
              margin: EdgeInsets.only(left: 20, top: 24, right: 51),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Log in with PIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 16,
              margin: EdgeInsets.only(left: 18, right: 19, bottom: 46),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 150,
                    height: 2,
                    margin: EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Container(),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 27),
                    child: Text(
                      "Or",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 12, 11, 11),
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        letterSpacing: 0.052,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 156,
                    height: 2,
                    margin: EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Container(),
                  ),
                ],
              ),
            ),
            Container(
              height: 52,
              margin: EdgeInsets.only(left: 20, right: 19, bottom: 83),
              decoration: BoxDecoration(
                color: AppColors.accentElement,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create an Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 10, 10, 10),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      letterSpacing: 0.108,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
