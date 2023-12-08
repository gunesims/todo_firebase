import 'package:flutter/material.dart';
import 'package:todo_firebase/screens/add_task_screen.dart';

import '../screens/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add_task': (context) => const AddTaskScreen(),
      },
    );
  }
}
