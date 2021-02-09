import 'package:flutter_app/bussiness_logic/models/INurseTask.dart';
import 'package:flutter_app/ui/components/IListItem.dart';
import 'package:flutter/material.dart';

class TaskItem implements IListItem {
  final INurseTask _nurseTask;
  TaskItem(this._nurseTask);

  @override
  Widget buildLeftImage(BuildContext context) => Text('T');

  @override
  Widget buildSubtitle(BuildContext context) =>
      Text(_nurseTask.getTaskDetails());

  @override
  Widget buildTitle(BuildContext context) => Text(_nurseTask.getTaskHeader());
}
