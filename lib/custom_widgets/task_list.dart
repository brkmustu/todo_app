import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/app_sizes.dart';
import 'package:todo_app/constants/color.dart';

List<TaskModel> todos = [
  TaskModel("Flutter", false),
  TaskModel("Rust-Lang", false),
  TaskModel("Javascript", true),
  TaskModel("SQL", true)
];

class TaskModel {
  String name;
  bool isChecked;

  TaskModel(this.name, this.isChecked);
}

Widget buildTaskList(BuildContext context) {
  return ListView.separated(
    // padding: const EdgeInsets.all(8),
    itemCount: todos.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        child: Center(child: Text('Entry ${todos[index].name}')),
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}
