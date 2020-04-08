import 'package:flutter/material.dart';
import 'package:timeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> timezones = [
    WorldTime(
        location: 'Addis Ababa', flag: 'assets/et.jpg', url: 'Africa/Nairobi'),
    WorldTime(
        location: 'Beijing', flag: 'assets/ch.jpg', url: 'Asia/Hong_Kong'),
    WorldTime(location: 'Paris', flag: 'assets/fr.png', url: 'Europe/Paris'),
    WorldTime(
        location: 'Los Angeles',
        flag: 'assets/us.png',
        url: 'America/Los_Angeles'),
    WorldTime(location: 'Moscow', flag: 'assets/ru.png', url: 'Europe/Moscow'),
    WorldTime(
        location: 'Johannesburg',
        flag: 'assets/sa.png',
        url: 'Africa/Johannesburg'),
    WorldTime(location: 'London', flag: 'assets/uk.png', url: 'Europe/London'),
    WorldTime(
        location: 'New York', flag: 'assets/us.png', url: 'America/New_York'),
    WorldTime(location: 'Berlin', flag: 'assets/ge.png', url: 'Europe/Berlin'),
    WorldTime(
        location: 'Chicago', flag: 'assets/us.png', url: 'America/Chicago'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(timezones[index].location),
              leading: CircleAvatar(
                  backgroundImage: AssetImage('${timezones[index].flag}')),
            ),
          );
        },
        itemCount: timezones.length,
      ),
    );
  }
}
