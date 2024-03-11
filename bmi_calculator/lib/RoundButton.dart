import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({required this.child,required this.onPressed});

  final Widget child;
  final VoidCallback onPressed;



  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      elevation: 0,
      constraints: BoxConstraints.tightFor(
          height: 56,
          width: 56
      ),
      shape: CircleBorder(),

      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),

    );
  }
}