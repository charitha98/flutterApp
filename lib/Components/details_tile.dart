import 'package:flutter/material.dart';

class DetailsTile extends StatelessWidget {
  final String heading;
  final String data;

  const DetailsTile({Key key, this.heading, this.data}) : super(key: key);

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
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
    );
  }
}
