import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class reusablecontainer extends StatelessWidget {
  reusablecontainer({required this.colour, required this.cardchild,required this.onPress});

  final Color colour;
  final Widget cardchild;
   final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        // Add the cardchild inside the Container
        child: cardchild,
      ),
    );
  }
}