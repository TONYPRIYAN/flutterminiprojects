
import 'package:climate_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

LocationScreen ls = LocationScreen();

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitute;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }
  void getLocationData() async {
    var Weatherdata  = await WeatherModel().getlocationweather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        locationWeather: Weatherdata,
      );
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
