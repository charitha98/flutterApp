import 'package:flutter/material.dart';

class SmallNavigationButton extends StatelessWidget {
  final text;
  final textColor;
  final color;

  const SmallNavigationButton({Key key, this.text, this.textColor, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146,
      height: 51,
      decoration: BoxDecoration(
        color: color == null ? Color.fromARGB(255, 155, 155, 155) : color,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text != null ? text : "Label",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor == null ? Colors.white : textColor,
              fontFamily: "SF Pro Text",
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
