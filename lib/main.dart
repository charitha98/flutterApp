import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sd012020/Screens/HIN_page.dart';
import 'package:sd012020/Screens/Searchdoctor_page.dart';
import 'package:sd012020/Screens/allergies_list_page.dart';
import 'package:sd012020/Screens/allergy_details_page.dart';
import 'package:sd012020/Screens/billing_History_details.dart';
import 'package:sd012020/Screens/billing_history_menu.dart';
import 'package:sd012020/Screens/doctor_details.dart';
import 'package:sd012020/Screens/drug_details.dart';
import 'package:sd012020/Screens/drug_shedulling.dart';
import 'package:sd012020/Screens/login_page.dart';
import 'package:sd012020/Screens/main_menu.dart';
import 'package:sd012020/Screens/patient_history.dart';
import 'package:sd012020/Screens/payment_bill_details.dart';
import 'package:sd012020/Screens/personal_information.dart';
import 'package:sd012020/Screens/pharmacy_drug_list.dart';
import 'package:sd012020/Screens/prescription_details.dart';
import 'package:sd012020/Screens/service_details.dart';
import 'package:sd012020/Screens/services_list.dart';
import 'package:sd012020/Screens/set_drug_schedule.dart';
import 'package:sd012020/Screens/settings_page.dart';
import 'package:sd012020/Screens/signup_page.dart';
import 'package:sd012020/Screens/verification_code_screen.dart';
import 'package:sd012020/Screens/HIN_verfication.dart';
import 'package:sd012020/Screens/HIN_verification_2.dart';
import 'package:sd012020/Screens/visit_details_page.dart';
import 'package:sd012020/Screens/visit_list.dart';
import 'Screens/verification_code_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",de
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainMenu(),
      routes: {
        HINVerification.id: (context) => HINVerification(),
        HINVerification2.id: (context) => HINVerification2(),
        VerificationCodeScreen.id: (context) => VerificationCodeScreen(),
        SignUpPage.id: (context) => SignUpPage(),
        LoginPage.id: (context) => LoginPage(),
        MainMenu.id: (context) => MainMenu(),
        SettingsPage.id: (context) => SettingsPage(),
        PersonalInformationPage.id: (context) => PersonalInformationPage(),
        PatientHistoryMenu.id: (context) => PatientHistoryMenu(),
        VisitsPage.id: (context) => VisitsPage(),
        VisitDetailsPage.id: (context) => VisitDetailsPage(),
        PrescriptionDetailsPage.id: (context) => PrescriptionDetailsPage(),
        DoctorDetailsPage.id: (context) => DoctorDetailsPage(),
        AllergiesListPage.id: (context) => AllergiesListPage(),
        AllergyDetailsPage.id: (context) => AllergyDetailsPage(),
        DrugSchedulingMainPage.id: (context) => DrugSchedulingMainPage(),
        SetDrugShedulePage.id: (context) => SetDrugShedulePage(),
        BillingHistoryMenu.id: (context) => BillingHistoryMenu(),
        BillingHistoryDetailsPage.id: (context) => BillingHistoryDetailsPage(),
        PaymentBillingDetails.id: (context) => PaymentBillingDetails(),
        SetDrugShedulePage.id: (context) => SetDrugShedulePage(),
        Searchdoctor.id: (context) => Searchdoctor(),
        PharmacyDrugList.id: (context) => PharmacyDrugList(),
        ServiceDetailsPage.id: (context) => ServiceDetailsPage(),
        DrugDetailsPage.id: (context) => DrugDetailsPage(),
        ServicesListPage.id: (context) => ServicesListPage(),
      },
    );
  }
}
