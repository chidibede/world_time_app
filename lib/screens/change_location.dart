import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime_api.dart';


class ChangeLocation extends StatefulWidget {
  @override
  _ChangeLocationState createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {

  List<WorldTimeApi> locations = [
    WorldTimeApi(url: 'Europe/London', location: 'London', flag: 'england.jpg'),
    WorldTimeApi(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.jpg'),
    WorldTimeApi(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTimeApi(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTimeApi(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTimeApi(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTimeApi(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTimeApi(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTimeApi(url: 'Africa/Lagos', location: 'Lagos', flag: 'Nigeria.jpg'),
  ];

  void updateTime(index) async {
    WorldTimeApi instance = locations[index];
    await instance.getDate();
    Navigator.pop(context, {
      'time': instance.time,
      'url': instance.url,
      'location': instance.location,
      'flag': instance.flag
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Change Location'),
      ),

      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
    ),
    );
  }
}
