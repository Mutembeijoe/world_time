import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    http.Response response =
        await http.get("http://worldtimeapi.org/api/timezone/Africa/Nairobi");
    Map data = jsonDecode(response.body);

    DateTime now = DateTime.parse(data['datetime']);
    String offset = (data['utc_offset'] as String).substring(1, 3);

    now = now.add(Duration(hours: int.parse(offset)));

    print(now);
    print(offset);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("Loading Screen")),
    );
  }
}
