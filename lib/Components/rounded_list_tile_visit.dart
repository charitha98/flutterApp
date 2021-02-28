import 'package:flutter/material.dart';
import 'package:sd012020/values.dart';

class RoundedVisitListTile extends StatelessWidget {
  final date;
  final String allergy;
  final onPressed;

  const RoundedVisitListTile({Key key, this.date, this.allergy, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 250,
          height: 111,
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            border: Border.fromBorderSide(Borders.primaryBorder),
            boxShadow: [
              Shadows.primaryShadow,
            ],
            borderRadius: BorderRadius.all(Radius.circular(28)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 25,
                margin: EdgeInsets.only(left: 45, top: 23, right: 47),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "VisitDate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: 21,
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        date == null ? "DD/MM/YY" : date,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: 21,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25,
                margin: EdgeInsets.only(left: 46, top: 13, right: 77),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Allergy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: 21,
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        allergy == null ? "Fever" : allergy,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: allergy.length < 8 ? 21 : 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
