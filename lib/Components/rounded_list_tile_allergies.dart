import 'package:flutter/material.dart';
import 'package:sd012020/values.dart';

class RoundedAllergiesListTile extends StatelessWidget {
  final String allergy;
  final String doctor;
  final onPressed;

  const RoundedAllergiesListTile(
      {Key key, this.allergy, this.doctor, this.onPressed})
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
                      alignment: Alignment.topLeft,
                      child: Text(
                        allergy == null ? "null" : allergy,
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
                        "Doctor",
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
                        doctor == null ? "null" : doctor,
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
