import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // Location name for the UI
  String time; // The time in that location
  String flag; // url to an asset flag icon
  String url; // Location url

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
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
    time = now.toString();
  }
}
