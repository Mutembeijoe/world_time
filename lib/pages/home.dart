import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Map data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/location'),
                icon: Icon(Icons.location_city),
                label: Text("Choose City"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 40.0, letterSpacing: 1),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  data['time'],
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
