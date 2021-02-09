import 'package:flutter/material.dart';
import 'package:flutter_app/ui/screens/main_screen/main_screen.dart';
import 'package:flutter_app/ui/screens/new_shift/new_shift.dart';
import 'package:flutter_app/ui/screens/patients/patientPage.dart';
//import 'package:firebase_core/firebase_core.dart';

import 'bussiness_logic/models/patient.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    //return NewShift();

    return MainScreen();
    /*return PatientPage(
      patient: Patient('NRN 3', 'Mati Caspi',
          'https://www.maariv.co.il/HttpHandlers/ShowImage.ashx?id=322703&w=500&h=380'),
    );*/
  }
}
