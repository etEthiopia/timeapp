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

  Future<void> getTime() async {
    try {
      // Make Request
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(res.body);

      // get Properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      print("Datetime: $datetime");
      print("Offset: $offset");

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));

      // set time property
      time = DateFormat.jm().format(now);
      isDay = now.hour < 6 || now.hour > 16 ? false : true;
    } catch (err) {
      print("Error: $err");
      time = "Couldn't get Data";
    }
  }
}
