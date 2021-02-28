import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper({@required this.url});

  final String url;

  Future getData() async {
    String username = 'his';
    String password = 'his12345';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    Response response = await get(
      url,
      headers: {"X-tenantID": "0333", 'authorization': basicAuth},
    );

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
