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
    String bgimage = data["isDay"] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgimage'), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Center(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 125.0),
                    child: FlatButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/location');
                        },
                        icon: Icon(Icons.edit_location, color: Colors.white70),
                        label: Text(
                          "Choose Location",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        )))),
            Center(
              child: Text(data["time"],
                  style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.w300)),
            ),
            SizedBox(height: 15.0),
            Center(
              child: Text(data["location"],
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.w200)),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
