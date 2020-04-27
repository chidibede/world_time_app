import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    String flag = data['flag'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("World Time", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),),
        centerTitle: true,
        elevation: 10,
      ),

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image:  AssetImage("assets/home.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              FlatButton.icon(
            icon: Icon(Icons.add_location),
            onPressed: () async {
              dynamic result = await Navigator.pushNamed(context, '/change_location');
              setState(() {
                data = {
                  'time': result['time'],
                  'url': result['url'],
                  'location': result['location'],
                  'flag': result['flag']
                };
              });
            },
            label: Text("Change Location", style: TextStyle(color: Colors.white, fontSize: 29.0, fontWeight: FontWeight.bold)),
              ),

              SizedBox(height: 15.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                   CircleAvatar(backgroundImage: AssetImage("assets/$flag")),
                  SizedBox(width: 15.0),
                  Text(data['location'], style: TextStyle(fontSize: 36.0, color: Colors.white, fontWeight: FontWeight.bold),),
                ],
              ),

              SizedBox(height: 15.0,),
              Text(data['time'], style: TextStyle(fontSize: 54.0, color: Colors.white, fontWeight: FontWeight.bold),),

          ]
          ),
        ),
      ),


    );
  }
}
