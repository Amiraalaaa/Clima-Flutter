import 'package:geolocator/geolocator.dart';

class Location
{
  double latitude;
  double longtiude;

  Location({this.latitude,this.longtiude});

  Future<void> getCurrentlocation()  async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);print(position);
          latitude=position.latitude;
          longtiude=position.longitude;

    }
    catch(e)
    {
      print(e);
    }
  }

}