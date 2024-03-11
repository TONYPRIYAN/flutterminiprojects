import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'input_page.dart';
import 'Calculate btn.dart';

class  Result extends StatelessWidget {

  Result({required this.cate,required this.bmi,required this.msg});



  final String cate;
  final String bmi;
  final String msg;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR',style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w300)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Expanded(child: Text('YOUR RESULT',style: TextStyle(color:Colors.white,fontSize: 40,fontWeight: FontWeight.w600,),))),
            Expanded(

              flex: 5,
                child: reusablecontainer(colour: kactivecolour, cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(cate,textAlign:TextAlign.center,style: TextStyle(color: Color(0xFF24D876,),fontSize: 22,fontWeight: FontWeight.bold),),
                    Text(bmi,style: TextStyle(color: Colors.white,fontSize: 100,fontWeight: FontWeight.bold),),
                    Text(msg,textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold))
                  ],
                  
                ), onPress: () {  },)
            ),
            Calculatebtn(onTap: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) => InputPage()));

            }, button: 'RE - CALCULATE',)


          ],
        ),
      )
      ,
    );
  }
}
