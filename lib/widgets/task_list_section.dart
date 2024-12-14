import 'package:flutter/cupertino.dart';
import 'package:myapp/widgets/task_list.dart';

class TaskListSection extends StatelessWidget {
  final Function onTaskDeleted;

  TaskListSection({required this.onTaskDeleted});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TaskList(onTaskDeleted: onTaskDeleted),
    );
  }
}
