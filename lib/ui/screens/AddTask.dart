import 'package:flutter/material.dart';
import 'package:flutter_app/bussiness_logic/models/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:todoey_flutter/models/task.dart';
//import 'package:provider/provider.dart';
//import 'package:todoey_flutter/models/task_data.dart';

class AddTask extends StatelessWidget {
  AddTask(this.patient);

  final Patient patient;
  final _firestore = FirebaseFirestore.instance;
  String _taskDescription = "";
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                _taskDescription = newText;
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                  _firestore.collection('Patients').doc(patient.Id).collection("Tasks").add({
                    "Handled":false,
                    "TaskType": "Nurse actions",
                    "description": _taskDescription,
                  });
                  patient.LoadTasks();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
