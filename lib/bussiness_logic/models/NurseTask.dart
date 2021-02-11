import 'package:flutter/cupertino.dart';

import 'INurseTask.dart';

class NurseTask implements INurseTask {
  NurseTask({@required this.taskIsDone, @required this.taskDetails, this.taskType});

  String taskDetails;
  String taskType;
  bool taskIsDone = false;

  @override
  bool done() {
    taskIsDone = !taskIsDone;
    print('Done');
    return taskIsDone;
  }

  @override
  String getTaskDetails() {
    return (taskDetails);
  }

  @override
  String getTaskHeader() {
    return (taskType);
  }

  @override
  bool isDone() {
    return taskIsDone;
  }
}
