import 'package:flutter/material.dart';
import 'package:timeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> timezones = [
    WorldTime(
        location: 'Beijing', flag: 'assets/ch.jpg', url: 'Asia/Hong_Kong'),
    WorldTime(
        location: 'Addis Ababa', flag: 'assets/et.jpg', url: 'Africa/Nairobi'),
    WorldTime(location: 'Berlin', flag: 'assets/ge.png', url: 'Europe/Berlin'),
    WorldTime(
        location: 'Chicago', flag: 'assets/us.png', url: 'America/Chicago'),
    WorldTime(
        location: 'Istanbul', flag: 'assets/tr.jpg', url: 'Europe/Istanbul'),
    WorldTime(
        location: 'Johannesburg',
        flag: 'assets/sa.png',
        url: 'Africa/Johannesburg'),
    WorldTime(location: 'Lisbon', flag: 'assets/pr.jpg', url: 'Europe/Lisbon'),
    WorldTime(location: 'London', flag: 'assets/uk.png', url: 'Europe/London'),
    WorldTime(
        location: 'Los Angeles',
        flag: 'assets/us.png',
        url: 'America/Los_Angeles'),
    WorldTime(location: 'Madrid', flag: 'assets/sp.jpg', url: 'Europe/Madrid'),
    WorldTime(location: 'Moscow', flag: 'assets/ru.png', url: 'Europe/Moscow'),
    WorldTime(
        location: 'New York', flag: 'assets/us.png', url: 'America/New_York'),
    WorldTime(location: 'Paris', flag: 'assets/fr.png', url: 'Europe/Paris'),
    WorldTime(location: 'Rome', flag: 'assets/it.jpg', url: 'Europe/Rome'),
    WorldTime(
        location: 'Sao Paulo', flag: 'assets/br.jpg', url: 'America/Sao_Paulo'),
    WorldTime(location: 'Seoul', flag: 'assets/sk.jpg', url: 'Asia/Seoul'),
    WorldTime(
        location: 'Sydney', flag: 'assets/au.jpg', url: 'Australia/Sydney'),
    WorldTime(location: 'Tokyo', flag: 'assets/jp.jpg', url: 'Asia/Tokyo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Choose a Location"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () async {
                    WorldTime ins = timezones[index];
                    if (Navigator.canPop(context)) {
                      await ins.getTime();
                      Navigator.pop(context, {
                        "location": ins.location,
                        "flag": ins.flag,
                        "time": ins.time,
                        "isDay": ins.isDay
                      });
                    } else {
                      await ins.getTime();
                      Navigator.pushReplacementNamed(context, '/home',
                          arguments: {
                            "location": timezones[index].location,
                            "flag": timezones[index].flag,
                            "time": ins.time,
                            "isDay": ins.isDay
                          });
                    }
                  },
                  title: Text(timezones[index].location),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage('${timezones[index].flag}')),
                ),
              ));
        },
        itemCount: timezones.length,
      ),
    );
  }
}
