import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/bindings/main.binding.dart';
import 'package:myapp/providers/task.provider.dart';
import 'package:myapp/services/task.services.dart';
import 'package:myapp/views/task.view.dart';
import 'package:myapp/views/home.view.dart';
import 'package:provider/provider.dart';

const homeRoute = "/home";
const tasksRoute = "/tasks";

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}

void main() {
  Get.put(ThemeController());

  runApp(
    MultiProvider(
      providers: [
        Provider<TaskService>(create: (_) => TaskService()),
        ChangeNotifierProvider(
          create: (context) => TaskProvider(Get.find<TaskService>()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: Get.find<ThemeController>().isDarkMode.value
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: homeRoute,
      getPages: [
        GetPage(
          name: homeRoute,
          page: () => HomeView(),
          binding: MainBindings(),
        ),
        GetPage(
          name: tasksRoute,
          page: () => TasksView(),
        ),
      ],
    );
  }
}
