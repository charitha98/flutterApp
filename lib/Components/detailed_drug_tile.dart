import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class DetailedDrugTile extends StatelessWidget {
  final String drugNumber;
  final String drugName;
  final String quantity;
  final String period;
  final String frequency;
  final String dosage;

  const DetailedDrugTile(
      {Key key,
      this.drugNumber,
      this.drugName,
      this.quantity,
      this.period,
      this.frequency,
      this.dosage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      leading: CircleAvatar(child: Text('$drugNumber')),
      title: Text(
        'Drug $drugNumber',
        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
      ),
      subtitle: Text(
        '$drugName',
        style: TextStyle(fontSize: 21, color: Colors.black),
      ),
      children: <Widget>[
        Divider(
          thickness: 1.0,
          height: 1.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              "Prescribed Item's \n" +
                  "Quantity\t\t\t\t\t:  $quantity\n" +
                  "Period\t\t\t\t\t\t\t\t:  $period Days\n" +
                  "Frequency\t:  $frequency\n" +
                  "Dosages\t   :  $dosage",
              style:
                  Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
