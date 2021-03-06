import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/services/time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final List<City> cities = [
    City(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    City(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    City(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    City(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    City(url: 'America/New_York', location: 'NewYork', flag: 'usa.png'),
    City(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    City(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  ];

  void updateTime(index) async {
    City city = cities[index];
    await city.getTime();
    Navigator.pop(context, {
      'time': city.time,
      'location': city.location,
      'flag': city.flag,
      'isDayTime': city.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${cities[index].flag}'),
                  ),
                  title: Text(cities[index].location),
                  onTap: () => {updateTime(index)},
                ),
              ),
            );
          }),
    );
  }
}
