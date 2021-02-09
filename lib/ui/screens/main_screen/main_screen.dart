import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main_screen_button.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key) {}

  @override
  _MainScreenState createState() => _MainScreenState();

  /* final Function func1 = () => print('1');*/
  Function func2 = () => print('2');
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final title = 'MetaVision for Nursing ';

    return MaterialApp(
      title: title,
      home: Scaffold(
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
                          print('New shift');
                          setState(() {
                            try {
                              //function2 = widget.func2;
                              if (widget.func2 == null)
                                widget.func2 = () => print('2');
                              else
                                widget.func2 = null;
                            } catch (e) {
                              print('error');
                            }
                          });
                        },
                      ),
                      MainScreenButton(
                        text: 'My Patients',
                        iconData: FontAwesomeIcons.addressBook,
                        onPressed: () {
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
                          print('All Tasks');
                        },
                      ),
                      MainScreenButton(
                        text: 'End Shift',
                        onPressed: widget.func2,
                        iconData: FontAwesomeIcons.stopCircle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
