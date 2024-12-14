import 'package:flutter/material.dart';
import 'package:myapp/widgets/task_count_display.dart';
import 'package:myapp/widgets/task_input_form.dart';
import 'package:myapp/widgets/task_list_section.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import '../providers/task.provider.dart';

class TasksView extends StatelessWidget {
  final taskForm = TextEditingController();

  Future<void> _addTask(BuildContext context) async {
    if (taskForm.text.isNotEmpty) {
      String title = taskForm.text;

      await Provider.of<TaskProvider>(context, listen: false).addTask(title);

      taskForm.clear();

      toastification.show(
        context: context,
        title: Text('Item adicionado com sucesso'),
        autoCloseDuration: const Duration(seconds: 2),
        alignment: Alignment.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            TaskInputForm(controller: taskForm, onSubmit: () => _addTask(context)),
          ],
        ),
      ),
      body: Column(
        children: [
          TaskCountDisplay(),
          TaskListSection(onTaskDeleted: () {
            Provider.of<TaskProvider>(context, listen: false).updateTaskCount();
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
