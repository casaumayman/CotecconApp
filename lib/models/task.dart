import 'package:flutter_getx_boilerplate/shared/shared.dart';

class Task {
  String projectName;
  String contractor;
  String jobName;
  DateTime startTime;
  DateTime endTime;
  TaskStatus status;

  Task(this.projectName, this.contractor, this.jobName, this.startTime,
      this.endTime, this.status);
}
