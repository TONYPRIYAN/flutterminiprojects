
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playsound(int note)

  {
    int n = note;
    final player = AudioPlayer();
    player.play(AssetSource('note$n.wav'));
  }

  Expanded bulidKey({required Color color,required int note})
  {
    return Expanded(
      child: TextButton(


        style: TextButton.styleFrom(

          backgroundColor: color,
        ),
        child: Text(''),
        onPressed: ()  {
          playsound(note);


        },


      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [
              bulidKey(color:Colors.redAccent,note:1),
              bulidKey(color:Colors.orangeAccent,note:2),
              bulidKey(color:Colors.yellowAccent,note:3),
              bulidKey(color:Colors.greenAccent,note:4),
              bulidKey(color:Colors.blueAccent,note:5),
              bulidKey(color:Colors.indigo,note:6),
              bulidKey(color:Colors.purple,note:7),


            ],

          ),
        ),
      ),
    );
  }
}
