import 'package:flutter/material.dart';

import '../values.dart';

class MainMenuCard extends StatelessWidget {
  final text;
  final image;
  final color;
  final onClick;

  const MainMenuCard(
      {Key key,
      this.text,
      @required this.image,
      this.color,
      @required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(0xFF4700E6),
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 180,
        margin: EdgeInsets.only(top: 20),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned(
              top: 53,
              right: 33,
              child: Container(
                width: 350,
                height: 118,
                decoration: BoxDecoration(
                  color: color, //AppColors.ternaryBackground,
                  border: Border.fromBorderSide(Borders.primaryBorder),
                  boxShadow: [
                    Shadows.primaryShadow,
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
                child: Container(),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 355,
                      height: 129,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          image, //"images/appointmentImage.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 45, top: 6),
                      child: Text(
                        text, //"Appointment system",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                        ),
                      ),
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
