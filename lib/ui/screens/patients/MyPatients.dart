import 'package:flutter/material.dart';

class MyPatients extends StatelessWidget {

  //MyApp({Key key, @required this.items}) : super(key: key);
  MyPatients({Key key}) : super(key: key) { }

  @override
  Widget build(BuildContext context) {
    final title = 'My Shift Patients';
    //var route = ModalRoute.of(context).settings.name;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}