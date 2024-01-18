import 'package:flutter/material.dart';
import 'package:todo_app/tasks/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> todos;
  const TaskList({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    //expanded widgetini sildik
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ItemWidget(task: todos[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.blueGrey, // Ayırıcı rengi
          );
        },
      ),
    );
  }
}

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  children: [
                    widget.task.getTypeImage(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.task.title, style: const TextStyle(fontWeight: FontWeight.bold,),
                          ),
                          Text(widget.task.description.length > 30
                              ? widget.task.description.substring(0, 30)
                              : widget.task.description),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Checkbox(
                value: widget.task.isCompleted,
                onChanged: (bool? value) {
                  setState(() {
                    widget.task.isCompleted = value!;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
