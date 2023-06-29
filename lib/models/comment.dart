import 'package:flutter_getx_boilerplate/models/models.dart';

class Comment {
  int? id;
  Task? task;
  String? msg;
  DateTime? time;

  Comment({this.id, this.task, this.msg, this.time});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    task = json['task'] != null ? new Task.fromJson(json['task']) : null;
    msg = json['msg'];
    time = DateTime.parse(json['time']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.task != null) {
      data['task'] = this.task!.toJson();
    }
    data['msg'] = this.msg;
    data['time'] = this.time;
    return data;
  }
}
