import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  void getTime() async {
    // Make Request
    Response res =
        await get('http://worldtimeapi.org/api/timezone/Africa/Nairobi');
    Map data = jsonDecode(res.body);

    // get Properties
    String datetime = data['datetime'];
    String offset = data['utc_offset'];
    print("Datetime: $datetime");
    print("Offset: $offset");

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));
    print("Now: $now");
  }
}
