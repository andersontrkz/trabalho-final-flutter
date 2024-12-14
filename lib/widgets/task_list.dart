import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/task.controller.dart';
import 'package:toastification/toastification.dart';

class TaskList extends GetView<TaskController> {
  final Function onTaskDeleted;

  TaskList({required this.onTaskDeleted});

  @override
  Widget build(BuildContext context) {
    controller.getSavedData();

    return controller.obx((allTasks) {
      return ListView.builder(
        itemCount: allTasks?.length,
        itemBuilder: (BuildContext context, int index) {
          var task = allTasks?[index];
          var city = task?.city ?? '';
          var weather = task?.weather ?? '';

          if (task != null) {
            return Dismissible(
              key: Key(task.title),
              background: Container(color: Colors.red.withOpacity(0.2)),
              onDismissed: (direction) {
                controller.deleteData(task);
                onTaskDeleted();

                toastification.show(
                  context: context,
                  title: Text('Item removido com sucesso'),
                  autoCloseDuration: const Duration(seconds: 2),
                  alignment: Alignment.center,
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckboxListTile(
                      title: Text(task.title),
                      subtitle: Text(
                          'Local: ' + city + ' | Clima: ' + weather,
                          style: TextStyle( color: Colors.grey, fontSize: 14),
                      ),
                      key: Key(task.title),
                      value: task.done,
                      onChanged: (value) {
                        controller.updateData(task);
                      },
                    ),
                  ],
                ),
              ),
            );
          }

          return null;
        },
      );
    },
    onError: (error) => Text('Não foi possível localizar nenhum registro'),
    onLoading: const CircularProgressIndicator());
  }
}
