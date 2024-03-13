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
    return ListView.builder(itemBuilder:(context,index){
      return TaskTile(isChecked:tasks[index].isDone , taskTitle: tasks[index].name,
        checkboxCallback: (bool? checkboxState) {
          setState(() {
            tasks[index].toggleDone();
          });
        }
      );

    },itemCount: tasks.length,
    );
  }
}