import 'package:flutter/material.dart';
import 'package:sd012020/values.dart';

class RoundedBillingListTile extends StatelessWidget {
  final String date;
  final String invoiceNumber;
  final double totalAmount;
  final onPressed;
  final String doctorname;
  final bool paidstatus;
  final String description;

  const RoundedBillingListTile(
      {Key key,
      this.date,
      this.invoiceNumber,
      this.totalAmount,
      this.doctorname,
      this.paidstatus,
        this.description,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 250,
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
                margin: EdgeInsets.only(left: 43, top: 23, right: 47),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Date",
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
                        date == null ? ": DD/MM/YY" : date,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8D9CFF),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25,
                margin: EdgeInsets.only(left: 43, top: 5, right: 47),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Invoice No",
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
                        invoiceNumber == null ? ": 800500543" : invoiceNumber,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8D9CFF),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25,
                margin:
                    EdgeInsets.only(left: 43, top: 5, right: 45, bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Total Amount",
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
                        "$totalAmount",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8D9CFF),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
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
      ),
    );
  }
}
