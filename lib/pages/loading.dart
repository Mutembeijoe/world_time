import 'package:flutter/material.dart';
import 'package:worldtime/services/time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpTime() async {
    var city =
        City(url: "Africa/Nairobi", location: "Nairobi", flag: 'Nairobi.png');
    await city.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': city.time,
      'location': city.location,
      'flag': city.flag,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Loading Screen"),
      ),
    );
  }
}
