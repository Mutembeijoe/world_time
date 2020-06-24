import 'package:http/http.dart' as http;
import 'dart:convert';

class City {
  String url;
  String time;
  String location;
  String flag;

  City({this.url, this.location, this.flag});
  Future<void> getTime() async {
    try {
      http.Response response =
          await http.get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);

      DateTime now = DateTime.parse(data['datetime']);
      String offset = (data['utc_offset'] as String).substring(1, 3);

      now = now.add(Duration(hours: int.parse(offset)));

      time = now.toString();
    } catch (e) {
      print(e);
      time = "Failed to load time";
    }
  }
}
