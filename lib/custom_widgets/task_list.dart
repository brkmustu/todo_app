import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TaskModel {
  String name;
  bool isChecked;

  TaskModel(this.name, this.isChecked);
}

class TaskList extends StatelessWidget {
  final String name;
  final List<TaskModel> todos;
  const TaskList({required this.name, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView.separated(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ItemWidget(text: 'Item ${todos[index].name}');
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.blueGrey, // Ayırıcı rengi
            );
          },
        ),
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
    return Container(
      height: 70,
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          // GestureDetector(
          //   child: Icon(
          //     Icons.description,
          //     color: HexColor("DBECF6"),
          //   ),
          // )
        ],
      ),
      // child: Center(child: Text(text)),
    );
  }
}
