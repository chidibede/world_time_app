import 'package:flutter/material.dart';
import 'package:worldtime/screens/loading.dart';
import 'package:worldtime/screens/home.dart';
import 'package:worldtime/screens/change_location.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/change_location': (context) => ChangeLocation()

},
));