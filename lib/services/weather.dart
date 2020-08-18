import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
const APIkey = '0823f108c077b6e60715be1ba26bb971';
const openmapurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

 Future<dynamic> gelocationweather() async {
  Location mylocation = Location();
  await mylocation.getCurrentlocation();
  Networking helper = Networking(
      '$openmapurl?lat=${mylocation.latitude}&lon=${ mylocation.longtiude}&appid=$APIkey&units=metric');

  var weatherdata = await helper.getdata();
  return weatherdata;
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
