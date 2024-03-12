import 'package:flutter/cupertino.dart';
import 'package:to_do_list/Widgets/task_tile.dart';

class TasksList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(),
        TaskTile(),
        TaskTile(),
      ],


    );
  }
}