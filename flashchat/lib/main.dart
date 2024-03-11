import 'package:firebase_core/firebase_core.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ? await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey:'AIzaSyA4w8781R4jWqUW9i1qq7vZBQiE0CaDy3M', appId: '1:1016737696828:android:8deca67a24dcf13afdc739',
        messagingSenderId: '1016737696828', projectId: 'flashchat-3eedc')

  ):await Firebase.initializeApp();

  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      // home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes:{
        WelcomeScreen.id:(context) => WelcomeScreen(),
        LoginScreen.id:(context) => LoginScreen(),
        RegistrationScreen.id:(context) => RegistrationScreen(),
        ChatScreen.id:(context) => ChatScreen(),



      },
    );
  }
}
