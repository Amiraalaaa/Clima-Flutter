import 'dart:convert';
import 'package:http/http.dart' as http ;

class Networking{

  Networking(this.url);
  final String url ;

  Future getdata() async
  {
    http.Response myresponse = await http.get(url);
    if(myresponse.statusCode==200) {
      String data = myresponse.body;
      return jsonDecode(data);
    }
    else{
      print(myresponse.statusCode);
    }
  }
}