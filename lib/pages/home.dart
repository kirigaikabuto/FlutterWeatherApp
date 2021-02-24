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
    print(data);
    String backgroundImage = data["is_day_time"] ? "day.png" : "night.png";
    Color backgroundColor =
        data["is_day_time"] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/$backgroundImage"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  setState(() {
                    data = {
                      "name": result["name"],
                      "time": result["time"],
                      "flag": result["flag"],
                      "is_day_time": result["is_day_time"]
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["name"],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(data["time"],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
