abstract class INurseTask {
  TaskType taskType();

  bool done();
  String getTaskHeader();
  String getTaskDetails();
  bool isDone();

}

enum TaskType { task, order, patientRequest }
