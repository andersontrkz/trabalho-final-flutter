import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.provider.dart';

class TaskCountDisplay extends StatefulWidget {
  @override
  _TaskCountDisplayState createState() => _TaskCountDisplayState();
}

class _TaskCountDisplayState extends State<TaskCountDisplay> {
  String message = "Nenhuma tarefa registrada";

  @override
  Widget build(BuildContext context) {
    final taskCount = Provider.of<TaskProvider>(context).taskCount;

    if (taskCount > 0 && message != "Total de tarefas: $taskCount") {
      setState(() {
        message = "Total de tarefas: $taskCount";
      });
    } else if (taskCount == 0 && message != "Nenhuma tarefa registrada") {
      setState(() {
        message = "Nenhuma tarefa registrada";
      });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
