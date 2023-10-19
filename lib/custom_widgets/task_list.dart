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

class TaskList extends StatelessWidget {
  final String name;
  const TaskList({required this.name});

  RoundedRectangleBorder getCardBorder(index) {
    if (index == 0) {
      return const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20), bottom: Radius.circular(0)),
      );
    } else if (index > 0 && index < todos.length - 1) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      );
    } else {
      return const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(0), bottom: Radius.circular(20)),
      );
    }
  }

  EdgeInsets getCardPadding(index) {
    if (index == 0) {
      return const EdgeInsets.fromLTRB(20, 20, 20, 0);
    } else if (index > 0 && index < todos.length - 1) {
      return const EdgeInsets.fromLTRB(20, 0, 20, 0);
    } else {
      return const EdgeInsets.fromLTRB(20, 0, 20, 20);
    }
  }

  @override
  Widget build(BuildContext context) {
    const items = 16;

    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: constraints.maxHeight,
                minHeight: getDeviceHeight(context) - 300,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                    items, (index) => ItemWidget(text: 'Item $index')),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(text)),
      ),
    );
  }
}
