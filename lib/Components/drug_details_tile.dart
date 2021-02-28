import 'package:flutter/material.dart';

import '../values.dart';

class DrugDetailsTile extends StatelessWidget {
  final String label;
  final String data;

  const DrugDetailsTile({Key key, this.label, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   trailing: Text(
    //     data == null ? 'null' : data,
    //     style: TextStyle(color: Color(0xFF2699FB), fontSize: 16),
    //   ),
    //   leading: Text(
    //     label == null ? 'null' : label,
    //     style: TextStyle(color: Color(0xFF2699FB), fontSize: 20),
    //   ),
    // );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        width: 250,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.fromBorderSide(Borders.primaryBorder),
          boxShadow: [
            Shadows.primaryShadow,
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 55,
              margin: EdgeInsets.only(left: 35, top: 25, right: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      label == null ? 'null' : label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      data == null ? 'null' : data,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
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
