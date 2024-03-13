import 'package:flutter/cupertino.dart';
import 'package:to_do_list/Widgets/task_tile.dart';
import '../model/task.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/model/task_data.dart';

class TasksList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(itemBuilder:(context,index){
          return TaskTile(isChecked:taskData.tasks[index].isDone , taskTitle: taskData.tasks[index].name,
              checkboxCallback: (bool? checkboxState) {
                // setState(() {
                //   Provider.of<TaskData>(context).tasks[index].toggleDone();
                // });
              }
          );
        },itemCount:taskData.taskCount,
        );
      },

    );
  }
}