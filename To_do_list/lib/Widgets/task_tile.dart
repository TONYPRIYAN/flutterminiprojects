import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TaskTile extends StatelessWidget {

    bool isChecked = false;
    String taskTitle;


  TaskTile({required this.isChecked,required this.taskTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value:isChecked, onChanged: (bool? value) {

      },


      )


      );

  }
}
//
// (bool? checkboxState) {
// setState(() {
// isChecked = checkboxState ?? false;
// });
// }


