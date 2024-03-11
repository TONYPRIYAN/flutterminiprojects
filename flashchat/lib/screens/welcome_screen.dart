import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  static const String id='welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this);

    //animation = CurvedAnimation(parent: controller, curve:Curves.easeIn);
    animation = ColorTween(begin: Colors.red,end: Colors.white).animate(controller);
    controller.forward();

    // animation.addStatusListener((status) {
    //   print(status);
    //   if(status == AnimationStatus.completed)
    //     {
    //       controller.reverse(from: 1.0);
    //     }
    //   else
    //     {
    //       controller.forward();
    //     }
    // });
    controller.addListener(() {
      setState(() {
        //print(animation.value);

      });
    });

    void dispose(){
      controller.dispose();
      super.dispose();
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            fontFamily: 'Agne'
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Flash Chat'),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(color: Colors.lightBlueAccent, btntitle: 'Login', onpressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            } ),

            RoundedButton(color: Colors.blueAccent, btntitle: 'Register', onpressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            }),
          ],
        ),
      ),
    );
  }
}



