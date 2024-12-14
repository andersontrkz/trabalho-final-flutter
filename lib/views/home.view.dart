import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Bem-vindo ao seu gerenciador de tarefas diárias!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tasks');
              },
              child: Text("Começar a Gerenciar Atividades"),
            ),
            Padding(padding: EdgeInsetsDirectional.symmetric(vertical: 8)),
            ElevatedButton.icon(
              onPressed: () {
                Get.find<ThemeController>().toggleTheme();
              },
              icon: Icon(Icons.wb_sunny),
              label: Text('Trocar Tema'),
            ),
          ],
        ),
      ),
    );
  }
}
