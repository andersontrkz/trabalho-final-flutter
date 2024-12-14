import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskInputForm extends StatelessWidget {
  final TextEditingController controller;
  final Function onSubmit;

  TaskInputForm({required this.controller, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Digite aqui uma tarefa",
      ),
      style: TextStyle(color: Colors.black),
      onFieldSubmitted: (_) => onSubmit(),
    );
  }
}
