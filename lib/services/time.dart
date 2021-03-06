import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class City {
  String url;
  String time;
  String location;
  String flag;
  bool isDayTime;

  City({this.url, this.location, this.flag});
  Future<void> getTime() async {
    try {
      http.Response response =
          await http.get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);

      DateTime now = DateTime.parse(data['datetime']);
      String offset = (data['utc_offset'] as String).substring(1, 3);

      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = "Failed to load time";
    }
  }
}
