import 'package:flutter_app/bussiness_logic/models/INurseTask.dart';
import 'package:flutter_app/bussiness_logic/models/NurseTask.dart';
import 'package:flutter_app/bussiness_logic/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/components/patientComponent.dart';
import 'package:flutter_app/ui/screens/patients/TaskItem.dart';

import 'TaskCard.dart';

class PatientPage extends StatelessWidget {
  final Patient patient;
  List<INurseTask> items;

  PatientPage({Key key, @required this.patient}) : super(key: key) {
    this.items = loadTasks();
  }
  @override
  Widget build(BuildContext context) {
    final title = 'iMDsoft - Taking great care of people';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Column(children: [
              Row(
                children: [
                  Container(
                    width: 200,
                    alignment: Alignment.topLeft,
                    child: PatientComponent.getPatientAvatar(
                        context, patient.FullName, patient.Picture,patient.alertOn),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Text('MRN:' + patient.MRNumber,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(patient.FullName,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      // Let the ListView know how many items it needs to build.
                      itemCount: items.length,
                      // Provide a builder function. This is where the magic happens.
                      // Convert each item into a widget based on the type of item it is.
                      itemBuilder: (context, index) {
                        final item = TaskItem(items[index]);
                        return TaskCard(listItem: item);
                      }),
                ),
              ),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("add task");
          },
          tooltip: 'Add task',
          child: Icon(Icons.add),
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }

  List<INurseTask> loadTasks() {
    return patient.tasksList;
  }
}
