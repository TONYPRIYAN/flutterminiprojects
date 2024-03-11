import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          children: [
            Icon(Icons.list),
            Text('Todey'),
            
          ],
        ),
      ),
    );
  }


}
