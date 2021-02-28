import 'package:flutter/material.dart';
import 'package:sd012020/Screens/personal_information.dart';

class SettingsPage extends StatelessWidget {
  static String id = 'settings_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                leading: Icon(
                  Icons.person_outline,
                  size: 50,
                  color: Colors.teal,
                ),
                title: Text('Personal Information'),
                onTap: () {
                  Navigator.pushNamed(context, PersonalInformationPage.id);
                },
              ),
            ),
            Card(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                leading: Icon(
                  Icons.settings,
                  size: 50,
                  color: Colors.cyan,
                ),
                title: Text('System config'),
              ),
            ),
            Card(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                leading: Icon(
                  Icons.exit_to_app,
                  size: 50,
                  color: Colors.grey,
                ),
                title: Text('Sign Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
