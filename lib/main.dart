import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' :(BuildContext context) => Loading(),
        '/home':(BuildContext context) => Home(),
        '/location' : (BuildContext context) => ChooseLocation(),
      },
    );
  }
}
