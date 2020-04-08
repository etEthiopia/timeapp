import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:timeapp/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading";
  String message = "Network Error";
  bool tryagain = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Visibility(
              child: SpinKitCubeGrid(color: Colors.grey[800], size: 100.0),
              visible: !tryagain),
          Visibility(
            child: IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  tryagain = false;
                });
                useSecondChance();
              },
              color: Colors.grey[800],
            ),
            visible: tryagain,
          ),
          Visibility(
            child: SizedBox(height: 40.0),
            visible: tryagain,
          ),
          Visibility(
            child: Text(
              message,
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0),
            ),
            visible: tryagain,
          )
        ])));
  }

  void secondchance() {
    setState(() {
      tryagain = true;
    });
  }

  void useSecondChance() async {
    await Future.delayed(Duration(seconds: 1));
    setupWorldTime();
  }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');

    await instance.getTime();
    instance.time != "Couldn't get Data"
        ? Navigator.pushReplacementNamed(context, '/home', arguments: {
            "location": instance.location,
            "flag": instance.flag,
            "time": instance.time,
            "isDay": instance.isDay
          })
        : secondchance();
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
}
