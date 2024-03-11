import 'package:climate_app/services/location.dart';
import '../services/networking.dart';


class WeatherModel {

  String apiKey = '6a4e69151174171fb75fd7e52a5c630c';
  String url = 'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getCityweather(String cityname)
  async {
    String cityurl = '$url?q=$cityname&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url:cityurl);
    var Weatherdata = await networkHelper.getData();

    return Weatherdata;
  }

  Future<dynamic> getlocationweather()
  async {
    Location location = Location();
    await location.getCurrentlocation();
    NetworkHelper networkHelper = NetworkHelper(
        url: '$url?lat=${location.latitute1}&lon=${location.longitute1}&appid=$apiKey&units=metric');
    var Weatherdata = await networkHelper.getData();
    return Weatherdata;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
