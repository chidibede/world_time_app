import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading...';
  void setTime() async {
    WorldTimeApi instance = WorldTimeApi(url: 'Europe/London', location: 'London', flag: 'england.jpg');
    await instance.getDate();
    setState(() {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'url': instance.url,
        'flag': instance.flag,
        'time': instance.time,
      });

    });

  }

  @override
  void initState() {
    super.initState();
    setTime();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("World Time", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34.0, color: Colors.white)),
                SizedBox(height: 10.0,),
                SpinKitFadingCube(
                  color: Colors.white,
                  size: 50.0,
                ),
              ],
            ),
          ),

      )

        );

  }
}

