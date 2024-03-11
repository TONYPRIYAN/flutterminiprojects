import 'package:flashchat/constants.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flashchat/screens/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {

  static const String id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

late String email;
late String password;
final _auth = FirebaseAuth.instance;
bool showspinner = false;



class _RegistrationScreenState extends State<RegistrationScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email=value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter your Email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,

                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter your Password"),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(color: Colors.blueAccent, btntitle: 'Register',  onpressed: () async {
                setState(() {
                  showspinner = true;
                });
                try
                {
                  final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);

                  if(newUser != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState(() {
                    showspinner = false;
                  });
                }
                catch(e){
                  print("registerscreen");
                  print(e);

                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
