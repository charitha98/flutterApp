import 'package:flutter/material.dart';

class LargeNavigationButton extends StatelessWidget {
  final color;
  final textColor;
  final text;
  final Function onPressed;

  LargeNavigationButton(
      {this.color, this.textColor, this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        // margin: EdgeInsets.only(top: 95, bottom: 17),
        decoration: BoxDecoration(
          color: color == null ? Color.fromARGB(255, 250, 66, 72) : color,
          borderRadius: BorderRadius.all(Radius.circular(26)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text == null ? 'Label' : text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor == null ? Colors.white : textColor,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 0.056,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
