import 'package:flutter/cupertino.dart';
import 'package:to_do_list/Widgets/task_tile.dart';
import '../model/task.dart';

class TasksList extends StatefulWidget {

  late final List<Task> tasks;

  TasksList({required this.tasks});


  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList>{




  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder:(context,index){
      return TaskTile(isChecked:widget.tasks[index].isDone , taskTitle: widget.tasks[index].name,
        checkboxCallback: (bool? checkboxState) {
          setState(() {
            widget.tasks[index].toggleDone();
          });
        }
      );

    },itemCount: widget.tasks.length,
    );
  }
}