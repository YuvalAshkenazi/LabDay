import 'package:flutter/cupertino.dart';

import 'INurseTask.dart';

class NurseTask implements INurseTask {
  NurseTask({@required this.taskName, @required this.taskDetails});

  String taskName;
  String taskDetails;
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
    return (taskName);
  }

  @override
  TaskType taskType() {
    return (TaskType.task);
  }

  @override
  bool isDone() {
    return taskIsDone;
  }
}
