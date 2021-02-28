import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:connectivity/connectivity.dart';

class NetworkAlerts{

  bool _alertLockPromptActive;            // _alertLockPromptActive is true if the a instance of the alert box is available

  bool get alertLockPromptActive => _alertLockPromptActive;

  set alertLockPromptActive(bool value) {
    _alertLockPromptActive = value;
  }


  /*
  *  alertLockListner(BuildContext context) , will listen to each network toggles and lock accordingly
  * */
  alertLockListener(BuildContext context){

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Auto connectivity check !
      if (result == ConnectivityResult.none) {
        print("before activation, state of prompt:  " + alertLockPromptActive.toString());
        Future.delayed(Duration.zero, () {
          alertLockPrompt(context);
        });
        print("After activation, state of prompt:  " + alertLockPromptActive.toString());
      }
    });


  }


  /*
  *  alertLockPrompt creates an alert box which insures the app is connected to the network. Once cannceled method needs to be
  *  re-invoked inorder to lock
  *
  * */

  void alertLockPrompt(BuildContext context) {
    if (_alertLockPromptActive == false){       // check if _alertLockPromptActive is true or false
      _alertLockPromptActive = true;            // if true, creation of a new alert box will be prevented, to prevent duplication.
      _showMyDialog(context);
    }
  } // end init


  /*
  *  _showMyDialog(BuildContext context) , the actual prompt itself
  * */
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(alignment:Alignment.center,
              child: Text('No Connection',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Align(alignment: Alignment.center,child: Icon(Icons.portable_wifi_off,size: 90,color: Colors.amber,)),
                SizedBox(height: 10),
                Align(alignment: Alignment.center,child: Text('Please connect to the internet',style: TextStyle(fontSize: 18),)),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Connect',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              onPressed: () async{
                var connectivityResult = await (Connectivity().checkConnectivity());     // check connectivity before cancelling the popup
                if (connectivityResult == ConnectivityResult.mobile) {
                  _alertLockPromptActive = false;
                  Navigator.pop(context);
                } else if (connectivityResult == ConnectivityResult.wifi) {
                  _alertLockPromptActive = false;
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

}


