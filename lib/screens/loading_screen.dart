import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
const APIkey = '0823f108c077b6e60715be1ba26bb971';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getlocationdata();

  }
void getlocationdata() async {
  var weatherData = await WeatherModel().gelocationweather();
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return LocationScreen(
      locationweather: weatherData,
    );
  }));
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
