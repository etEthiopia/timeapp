import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  String location; // Location name for the UI
  String time; // The time in that location
  String flag; // url to an asset flag icon
  String url; // Location url
  bool isDay; // true if the time is daytime;

  WorldTime({this.location, this.flag, this.url});

  Future<bool> getTime() async {
    try {
      // Make Request
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(res.body);

      // get Properties
      String datetime = data['datetime'];
      print("Datetime: $datetime");

      DateTime now = DateTime.parse(datetime.substring(0, 25));

      time = DateFormat.jm().format(now);
      isDay = now.hour < 6 || now.hour > 17 ? false : true;
      return true;
    } catch (err) {
      time = "Couldn't get Data";
      return false;
    }
  }
}
