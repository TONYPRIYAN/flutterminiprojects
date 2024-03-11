import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'RoundButton.dart';
import 'Result_page.dart';
import 'Calculate btn.dart';
import 'CalculateBMI.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{male,female}
enum Signs{plus,minus}
class _InputPageState extends State<InputPage> {



   Gender? Selectedcolor;
   int height = 180;
   int weight = 30;
   int age = 10;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR',style: TextStyle(color:Colors.white,fontSize: 35,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).primaryColor,

      ),


      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Row(
              children: [
                Expanded(child:  reusablecontainer(onPress: (){
                  setState(() {
                    Selectedcolor = Gender.male;
                  });
                },
                    colour: (Selectedcolor == Gender.male)?kactivecolour:kinactivecolour,
                  cardchild: iconcontent(icons:FontAwesomeIcons.mars,gender: 'MALE',)
                ),
                ),

                      Expanded(child:  reusablecontainer(onPress: (){
                        setState(() {
                          Selectedcolor=Gender.female;
                        });
                      },colour: (Selectedcolor == Gender.female)?kactivecolour:kinactivecolour,cardchild: iconcontent(icons: FontAwesomeIcons.venus, gender: 'FEMALE')))
              ],
            )),
             Expanded(child: Row(
               children: [
             Expanded(child:  reusablecontainer(colour:kactivecolour,cardchild: Column(
               mainAxisAlignment: MainAxisAlignment.center,

               children: [
                 Text('HEIGHT',style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(),style: KnumText,),
                    Center(child: Text('CM',style: kLabelTextStyle,)),
  ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SliderTheme(

                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: ksliderinactivecolour,
                            thumbColor: Color(0xFF2FE62C),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                            overlayColor: Color(0x29EB1555)
                          ),
                          child: Slider(value:height.toDouble(),
                            min: min,
                            max: max,
                            inactiveColor: ksliderinactivecolour,
                            onChanged: (double value) {
                            setState(() {
                              height = value.toInt();
                            });



                            } ,),
                        ),
                      ],
                    )
                  ],




             ), onPress: (){},)
             )

               ],
             )),
            Expanded(child: Row(
              children: [
                Expanded(child:  reusablecontainer(colour: kactivecolour,cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WEIGHT',style: kLabelTextStyle,),
                    Text(weight.toString(),style: KnumText,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButton(child: Icon(FontAwesomeIcons.minus,color: Colors.white),onPressed: (){
                          setState(() {
                            weight = weight - 1;
                          });
                        },),
                        SizedBox(
                          width: 20,
                        ),
                       RoundButton(child: Icon(FontAwesomeIcons.plus,color: Colors.white),onPressed: (){
                         setState(() {
                           weight = weight+1;

                         });
                       },)
                        ,
                      ],
                    )


                  ],
                ),onPress: (){}),),
                Expanded(child:  reusablecontainer(colour: kactivecolour,cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE',style: kLabelTextStyle,),
                    Text(age.toString(),style: KnumText,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButton(child: Icon(FontAwesomeIcons.minus,color: Colors.white),onPressed: (){
                          setState(() {
                           age = age - 1;
                          });
                        },),
                        SizedBox(
                          width: 20,
                        ),
                        RoundButton(child: Icon(FontAwesomeIcons.plus,color: Colors.white),onPressed: (){
                          setState(() {
                           age = age +1;

                          });
                        },)
                        ,
                      ],
                    )


                  ],


                ),onPress: (){},),)
              ],
            )),
            Calculatebtn(onTap: () {

              calculate cal = calculate(height: height, weight: weight);


              Navigator.push(context, MaterialPageRoute(builder: (context) => Result( bmi:cal.Calculate(),cate: cal.Category(), msg: cal.Msg())));
            }, button: 'CALCULATE',)
  ]



          )
    );
  }
}













