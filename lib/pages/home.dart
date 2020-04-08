import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 150.0),
              child: FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.location_on),
                  label: Text("Choose Location"))),
          Center(
            child: Text(data["time"], style: TextStyle(fontSize: 50.0)),
          ),
          SizedBox(height: 15.0),
          Center(
            child: Text(data["location"], style: TextStyle(fontSize: 25.0)),
          )
        ], crossAxisAlignment: CrossAxisAlignment.stretch),
      ),
    );
  }
}
