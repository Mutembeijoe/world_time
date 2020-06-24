import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Home Screen"),
            FlatButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/location'),
              icon: Icon(Icons.location_city),
              label: Text("Choose City"),
            )
          ],
        ),
      ),
    );
  }
}
