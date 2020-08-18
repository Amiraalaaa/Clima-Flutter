import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
const APIkey = '0823f108c077b6e60715be1ba26bb971';
const openmapurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> Getcityname(String cityname) async {
    Networking helper =
        Networking('$openmapurl?q=$cityname&appid=$APIkey&units=metric');
    var weatherdata = await helper.getdata();
    return weatherdata;
  }

  Future<dynamic> gelocationweather() async {
    Location location = Location();
    await location.getCurrentlocation();

    Networking networkHelper = Networking(
        '$openmapurl?lat=${location.latitude}&lon=${location.longtiude}&appid=$APIkey&units=metric');

    var weatherData = await networkHelper.getdata();
    return weatherData;
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
