import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/Dublin', location: 'Dublin', flag: 'ireland.png'),
    WorldTime(url: 'Europe/Pasris', location: 'Pasris', flag: 'france.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'united-states.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'united-kingdom.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'united-states.png'),
  ];

  void updateTime (index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayyTime,
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: (Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ),
              ),
            )),
          );
        }),
    );
  }
}
