import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee',style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        ),
        body: Dicepage(),
      ),
    ),
  );
}

class Dicepage extends StatefulWidget {
  const Dicepage({super.key});

  @override
  State<Dicepage> createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  int left=1;
  int right =1;


  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        children: [
          Expanded(

              child: TextButton(onPressed: ()
              {
                change();
              }, child: Image.asset('images/dice$left.png'),

              )
          ),
          Expanded(

              child: TextButton(
                  onPressed: () {
                   change();

                  },
                  child: Image.asset('images/dice$right.png'))
          )
        ],
      ),
    );
  }
  void change()
  {
    setState(() {
      left = Random().nextInt(6) + 1;
      right = Random().nextInt(6) + 1;
    }
      );
    }
}


