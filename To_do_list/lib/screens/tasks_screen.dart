import 'package:flutter/material.dart';
import 'package:to_do_list/screens/add_task.dart';
import '../Widgets/task_list.dart';
import '../model/task.dart';


class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();

}

class _TasksScreenState extends State<TasksScreen>{


  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy chicken'),

  ];







  @override
  Widget build(BuildContext context) {

    int tasksnum = tasks.length;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        
        onPressed: () {
          showModalBottomSheet(context: context, builder:(context) =>
              AddTaskScreen( addTaskCallback: (newTaskTitle){
                setState(() {
                  tasks.add(Task(name: newTaskTitle));
                });
                Navigator.pop(context);
              }));

      },),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60,left: 30,right: 30,bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 30),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Todoey',style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700),
                ),
                Text('$tasksnum tasks',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),),
              child: TasksList(tasks: tasks),
            ),
          ),
        ],
      ),
    );
  }


}



