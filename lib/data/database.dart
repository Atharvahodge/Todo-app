import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  // reference the box
  final _myBox = Hive.box('myBox');

  // run these method if these is the 1st time opening the app
  void createInitialData() {
    toDoList = [
      ["Add your task", false],
      ["Slide to delete the task", false],
    ];
  }

  // load the data from databse
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
