import 'package:flutter/cupertino.dart';
import 'constants.dart';

class Calculatebtn extends StatelessWidget {

  Calculatebtn({required this.onTap,required this.button});



  final String button;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,


      child: Container(
        child: Center(child: Text(button,style: TextStyle(color: Color(0xff111111),fontSize: 40,fontWeight: FontWeight.w600,),)),
        color: kbottomcolor,
        height: kbottomheight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}
