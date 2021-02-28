import 'package:flutter/material.dart';

class DetailsBillingTile extends StatelessWidget {
  final String heading;
  final String data;

  const DetailsBillingTile({Key key, this.heading, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: ListTile(
        isThreeLine: true,
        title: Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            heading == null ? 'null' : heading,
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
        ),
        subtitle: Text(
          data == null ? 'null' : data,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
