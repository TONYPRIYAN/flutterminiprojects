import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';



class iconcontent extends StatelessWidget {
  iconcontent({required this.icons,required this.gender});

  final IconData icons;
  final String gender;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icons,size: 80,color: Color(0xFF2FE62C)),
        SizedBox(height: 15,),
        Text(gender,style: kLabelTextStyle,)
      ],
    );
  }
}