import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Map data;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/location'),
                  icon: Icon(Icons.location_city, color: Colors.grey[300],),
                  label: Text("Choose City", style: TextStyle(color: Colors.grey[300]),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 40.0, letterSpacing: 1, color:Colors.white),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    data['time'],
                    style: TextStyle(fontSize: 50, color:Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
