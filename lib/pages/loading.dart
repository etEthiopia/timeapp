import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:timeapp/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitCubeGrid(color: Colors.grey[800], size: 100.0)));
  }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
}
