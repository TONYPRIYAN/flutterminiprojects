


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/main.dart';

class RoundedButton extends StatelessWidget {
  late Color color;
  late String btntitle;
  final VoidCallback onpressed;


  RoundedButton(
      {required this.color, required this.btntitle, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            btntitle,
          ),
        ),
      ),
    );
  }
}