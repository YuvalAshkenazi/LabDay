import 'package:flutter/material.dart';
import 'package:flutter_app/ui/screens/AllTasks.dart';
import 'package:flutter_app/ui/screens/EndShift.dart';
import 'package:flutter_app/ui/screens/main_screen/main_screen.dart';
import 'package:flutter_app/ui/screens/new_shift/new_shift.dart';
import 'package:flutter_app/ui/screens/patients/MyPatients.dart';

//import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Routes' ,
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MainScreen(),
        '/NewShift': (context) => NewShift(),
        '/EndShift': (context) => EndShift(),
        '/AllTasks': (context) => AllTasks(),
        '/MyPatients': (context) => MyPatients(),
      },
    );
  }
}

