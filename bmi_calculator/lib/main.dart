import 'package:flutter/material.dart';
import 'input_page.dart';
void main() => runApp(BMICalculator());



class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(// becomes the route named '/'


      theme: ThemeData(
        useMaterial3: true,
         primaryColor: Color(0x111111),
        scaffoldBackgroundColor: Color(0x111111),
        // textTheme: TextTheme(
        //   bodyMedium: TextStyle(color: Color(0xFFFFFFFF)
        //   )
        // )







      ),
      home: InputPage(),
    );
  }
}



