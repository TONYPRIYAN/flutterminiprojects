import 'package:flutter/cupertino.dart';
import 'package:to_do_list/Widgets/task_tile.dart';
import '../model/task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList>{
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy chicken'),

  ];



  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(isChecked: tasks[0].isDone, taskTitle: tasks[0].name,),
        TaskTile(isChecked: tasks[1].isDone, taskTitle: tasks[1].name,),
        TaskTile(isChecked: tasks[2].isDone, taskTitle: tasks[2].name,),
      ],


    );
  }
}