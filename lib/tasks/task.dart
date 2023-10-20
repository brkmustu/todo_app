import 'package:flutter/material.dart';
import 'package:todo_app/constants/task_types.dart';

class Task {
  final String title;
  final String description;
  late bool isCompleted;
  final TaskType type;

  Task({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.type,
  });

  Image getTypeImage() {
    switch (type) {
      case TaskType.note:
        return Image.asset("lib/assets/images/Category=Task.png");
      case TaskType.calender:
        return Image.asset("lib/assets/images/Category=Event.png");
      case TaskType.contest:
        return Image.asset("lib/assets/images/Category=Goal.png");
      default:
        return Image.asset("lib/assets/images/Category=Task.png");
    }
  }
}
