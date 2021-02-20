import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgimage = data["isDay"] != null
        ? data["isDay"]
            ? 'day.jpg'
            : 'night.jpg'
        : 'error.jpg';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgimage'), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Center(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 100.0),
                    child: FlatButton.icon(
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/location');
                          if (result != null) {
                            setState(() {
                              data = {
                                "location": result["location"],
                                "flag": result["flag"],
                                "time": result["time"],
                                "isDay": result["isDay"]
                              };
                            });
                          }
                        },
                        icon: Icon(Icons.edit_location, color: Colors.white),
                        label: Text(
                          "Choose Location",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )))),
            Center(
              child: Text(data["time"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
            ),
            SizedBox(height: 15.0),
            Center(
              child: Text(data["location"],
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w200)),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
