import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:timeapp/services/world_time.dart';

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

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    print("TIME: " + instance.time);
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
}
