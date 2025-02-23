import 'package:flutter/material.dart';
import 'package:todo/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDOList = [
    ['Create todo', false],
    ['Read to type', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDOList[index][1] = !toDOList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Todo',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.grey.shade400,
      ),
      body: ListView.builder(
        itemCount: toDOList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDOList[index][0],
            taskCompleted: toDOList[index][1],
            onChanged: (value) => checkBoxChanged(index),
          );
        },
      ),
    );
  }
}
