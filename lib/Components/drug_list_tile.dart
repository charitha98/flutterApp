import 'package:flutter/material.dart';
import 'package:sd012020/values.dart';

class DrugListTile extends StatelessWidget {
  final String text;
  final Function onPressed;

  const DrugListTile({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Container(
        height: 42,
        margin: EdgeInsets.only(left: 6, top: 15, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  text == null ? 'non' : text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Arial",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Container(
              height: 2,
              margin: EdgeInsets.only(top: 18),
              decoration: BoxDecoration(
                color: Color(0xfffa4248),
              ),
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
