import 'package:flutter/material.dart';
import 'package:worldtime/services/time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{
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
      backgroundColor:Colors.blue,
      body: SafeArea(
        child: Center(
          child: SpinKitSquareCircle(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
