
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(textAlign: TextAlign.center,'Add Task',style: TextStyle(fontSize: 30,color: Colors.lightBlueAccent),),
            TextField(
              
              autofocus: true,
              textAlign: TextAlign.center,
              style: TextStyle(
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                child: Text('Add task',style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                ),
              onPressed: (){

              },
                )
          ],
        ),

    );
  }
}
