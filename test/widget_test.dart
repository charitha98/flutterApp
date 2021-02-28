// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sd012020/Controllers/UserSignUpController.dart';
import 'package:sd012020/Controllers/verficationController.dart';
import 'package:sd012020/DB/DrugSchedule_DBHelper.dart';
import 'package:sd012020/Models/Customer.dart';
import 'package:sd012020/Models/Drug.dart';

import 'package:sd012020/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // // Build our app and trigger a frame.
    // await tester.pumpWidget(MyApp());
    //
    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);


    //
    // await tester.pumpWidget(
    //   Builder(
    //     builder: (BuildContext context) {
    //       var actual = SignUpController.getCustomer(context, 001);
    //       Future<Customer> ans;
    //       expect(actual, ans);
    //
    //       // The builder function must return a widget.
    //       return Placeholder();
    //     },
    //   ),
    // );

  });



  VerificationController verificationController = VerificationController();

  // test('email sending test',() async{
  //
  //   int actual = await verificationController.emailVerify(email: 'ntspathiran@agmail.com', verificationCode:12322);
  //   expect(actual, 1);
  //   int actual2 = await verificationController.emailVerify(email: 'ntsnamal5@agmail.com', verificationCode:12322);
  //   expect(actual2, 1);
  //
  // });


  // UserSignUpController FaceBookUpController = UserSignUpController();
  // test('HIN verification test',() async{
  //
  //     int actual = await FaceBookUpController.getCustomer(adadadde);  // user entered a number with less than 6 numbers
  //     expect(actual, -1);
  //     int actual2 = await FaceBookUpController.getCustomer(ntsnamal5@gmail.com); // user does not exist
  //     expect(actual2, -2);
  //     int actual3 = await FaceBookUpController.getCustomer(ntspathirana@gmail.com); // user exist
  //     expect(actual3, 1);
  //     int actual4 = await FaceBookUpController.getCustomer(ntsnamal5@gmail.com); // user does not exist
  //     expect(actual4, -2);
  //
  // });


  // DBHelper dbHelper = DBHelper ();
  //
  // test('Drug Schedule Database function test', () async{
  //
  //   Drug actual = await dbHelper.add(Drug(20,'panadol',"10mg","1",1));
  //   expect(actual, Drug(20,'panadol',"10mg","1",1));
  //
  // });

  // DBHelper dbHelper = DBHelper ();
  //
  // test('Drug Schedule Database function test', () async{
  //
  //   int actual = await dbHelper.update(Drug(1,'panadol',"10mg","1",1));
  //   expect(actual,1);
  //
  // });




}
