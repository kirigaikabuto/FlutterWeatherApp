import 'package:flutter/material.dart';
import "package:world_time_app/services/WorldTime.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading";

  void setupData() async {
    WorldTime wd =
        WorldTime(name: "Almaty", flag: "images/1.jpg", url: "Asia/Almaty");
    await wd.setTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "name": wd.name,
      "time": wd.time,
      "flag": wd.flag,
      "is_day_time": wd.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupData();
    print("init state function run");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
