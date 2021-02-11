import 'package:flutter/material.dart';
import 'package:flutter_app/ui/screens/patients/TaskItem.dart';

class AllTasks extends StatelessWidget {
  List<TaskItem> tasksList;
  //List<TaskItem> tasksList;

  //MyApp({Key key, @required this.items}) : super(key: key);
  AllTasks({Key key}) : super(key: key) { }
  AllTasks.taskList(this.tasksList) { }

  @override
  Widget build(BuildContext context) {
    final title = 'All Tasks';
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

