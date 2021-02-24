import 'dart:ffi';
import "package:http/http.dart";
import 'dart:convert';
import "package:intl/intl.dart";

class WorldTime {
  String name;
  String flag;
  String time;
  String url;
  bool isDayTime;
  WorldTime({this.name, this.flag, this.url});

  Future<Void> setTime() async {
    try {
      Response response =
          await get("https://www.worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      String date = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);
      DateTime now = DateTime.parse(date);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "could not get time";
    }
    // Response response = await get("https://jsonplaceholder.typicode.com/todos");
    // List todos = jsonDecode(response.body);
    // for (Map todo in todos) {
    //   print(todo["id"]);
    // }
    // String first = await Future.delayed(Duration(seconds: 3), () {
    //   return "first delay";
    // });
    // String second = await Future.delayed(Duration(seconds: 2), () {
    //   return "second delay";
    // });
    // print(first);
    // print(second);
    // print("get data method");
    // setState(() {
    //   time = "1234";
    // });
  }
}
