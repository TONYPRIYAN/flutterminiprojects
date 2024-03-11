

import 'package:flutter/material.dart';
import 'package:climate_app/utilities/constants.dart';
import 'package:climate_app/services/weather.dart';
import 'city_screen.dart';


class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});

  final  locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen> {

  WeatherModel wm = WeatherModel();
  int? temp;
  String? weathericon;
  String? cityname;
  String? weathermsg;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UPDATEui(widget.locationWeather);
  }
  void UPDATEui(dynamic weatherdata)
  {
setState(() {

  if(weatherdata == null)
    {
      temp = 0;
      cityname = "";
      weathermsg = 'unable to get weatherData';
      weathericon = 'error';
      return;
    }
    double tempe= weatherdata['main']['temp'];
    temp = tempe.toInt();
    cityname= weatherdata['name'];
    var condition = weatherdata['weather'][0]['id'];
    weathericon = wm.getWeatherIcon(condition);
    weathermsg = wm.getMessage(temp!);
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg16.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {

                      var weatherdata = await wm.getlocationweather();
                      UPDATEui(weatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedname = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();


                      }));
                  print(typedname);
                  if(typedname != null)
                    {
                    var weatherdata = await wm.getCityweather(typedname);
                    UPDATEui(weatherdata);

                    }
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(80),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weathericon',
                      style: kConditionTextStyle,
                    ),

                  ],
                ),
              ),
              Center(
                child: Text(
                  "$weathermsg",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
