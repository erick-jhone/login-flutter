import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 52, 78),
        title: const Text(
          'Bem-vindo a área de usuário',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Login realizado com sucesso!',
          style: TextStyle(
            fontSize: 20,
          ),
        )
      ]),
    );
  }
}
