import 'package:flutter/material.dart';

class EndShift extends StatelessWidget {

  //MyApp({Key key, @required this.items}) : super(key: key);
  EndShift({Key key}) : super(key: key) { }

  @override
  Widget build(BuildContext context) {
    final title = 'End Shift';
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