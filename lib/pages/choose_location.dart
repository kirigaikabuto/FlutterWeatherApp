import 'package:flutter/material.dart';
import 'package:world_time_app/services/WorldTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int count = 0;
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', name: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', name: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', name: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', name: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', name: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', name: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', name: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', name: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime wd = locations[index];
    await wd.setTime();
    Navigator.pop(context, {
      "name": wd.name,
      "time": wd.time,
      "flag": wd.flag,
      "is_day_time": wd.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build state function run");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("choose location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                    child: ListTile(
                        onTap: () {
                          updateTime(index);
                        },
                        title: Text(
                          locations[index].name,
                        ),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/${locations[index].flag}"),
                        ))));
          }),
    );
  }
}
