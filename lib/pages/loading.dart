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
  WorldTime instance =
      WorldTime(location: 'Addis Ababa', flag: 'et.jpg', url: 'Africa/Nairobi');
  Map data = {};

  @override
  Widget build(BuildContext context) {
    try {
      data = ModalRoute.of(context).settings.arguments;
      if (data != {}) {
        setLocation();
      }
    } catch (err) {
      print("Build in loading.dart Error: $err");
    }

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
          ),
        ])));
  }

  void secondchance() {
    try {
      setState(() {
        tryagain = true;
      });
    } catch (err) {
      print("SecondChance in loading.dart Error: $err");
    }
  }

  void useSecondChance() async {
    setupWorldTime();
  }

  void setLocation() {
    instance.location = data["location"];
    instance.flag = data["flag"];
    instance.url = data["url"];
    setupWorldTime();
  }

  void setupWorldTime() async {
    await instance.getTime();

    try {
      instance.time != "Couldn't get Data"
          ? Navigator.pushReplacementNamed(context, '/home', arguments: {
              "location": instance.location,
              "flag": instance.flag,
              "time": instance.time,
              "isDay": instance.isDay
            })
          : secondchance();
    } catch (err) {
      print("Go to Home in loading.dart Error: $err");
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
}
