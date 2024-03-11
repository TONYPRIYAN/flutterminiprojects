import 'package:flutter/material.dart';
import 'package:climate_app/utilities/constants.dart';
import 'location_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}
String? cityname;
class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg10.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child:  TextButton(
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return LocationScreen();
                    }));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value){
                    cityname = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextfield,

                ),

              ),
              TextButton(


                onPressed: () {
                  Navigator.pop(context,cityname);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle
                  ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
