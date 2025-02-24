import 'package:flutter/material.dart';
import 'package:todo/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDOList = [
    ['Create todo', false],
    ['Read to type', false],
  ];

  // for check box to check and dashed the task
  void checkBoxChanged(int index) {
    setState(() {
      toDOList[index][1] = !toDOList[index][1];
    });
  }

  // for saving new task on the todo app
  void saveNewTask() {
    setState(() {
      toDOList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  // to delete the task from the todo app
  void deleteTask(int index) {
    setState(() {
      toDOList.removeAt(index);
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
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                cursorColor: Colors.grey.shade500,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                  hintText: 'Add a new todo',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveNewTask,
            backgroundColor: Colors.grey.shade500,
            foregroundColor: Colors.grey.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
