import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main_screen_button.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key) {}

  @override
  _MainScreenState createState() => _MainScreenState();

  /* final Function func1 = () => print('1');*/
 // Function func2 = () => print('2');
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final title = 'MetaVision for Nursing ';
    final _firestore = FirebaseFirestore.instance;
    int _id = 3;
    
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      MainScreenButton(
                        text: 'New shift',
                        iconData: FontAwesomeIcons.playCircle,
                        onPressed: () {
                          Navigator.pushNamed(context, '/NewShift');
                          print('New shift');
                          /*setState(() {
                            try {
                              //function2 = widget.func2;
                              if (widget.func2 == null)
                                widget.func2 = () => print('2');
                              else
                                widget.func2 = null;
                            } catch (e) {
                              print('error');
                            }
                          });*/
                        },
                      ),
                      MainScreenButton(
                        text: 'My Patients',
                        iconData: FontAwesomeIcons.addressBook,
                        onPressed: () {
                          Navigator.pushNamed(context, '/MyPatients');
                          print('My Patients');
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      MainScreenButton(
                        text: 'All Tasks',
                        iconData: FontAwesomeIcons.tasks,
                        onPressed: () {
                          Navigator.pushNamed(context, '/AllTasks');
                          print('All Tasks');
                        },
                      ),
                      MainScreenButton(
                        text: 'End Shift',
                        onPressed: ()
                        {
                        Navigator.pushNamed(context, '/EndShift');
                        },
                        iconData: FontAwesomeIcons.stopCircle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _firestore.collection('Patients').add({
            'Name':"Patient $_id",
            'MRN': "MRN'$_id",
            'Nurse': 'Dana',
          });
          _id++;
        },
        tooltip: 'Emergency bell',
        child: Icon(Icons.add_alert),
        backgroundColor: Colors.red,
      ),
    );
  }
}
