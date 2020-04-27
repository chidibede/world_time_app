import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeApi {

  // class attributes
  String location;
  String time;
  String isDay;
  String url;
  String flag;

  WorldTimeApi({this.location, this.url, this.flag});


  Future<void> getDate() async {
    try {
      // Send a get request to the api and store the data needed
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map date = jsonDecode(response.body);
      String datetime = date['datetime'];
      int offset = int.parse(date['utc_offset'].substring(1, 3));

      // convert to datetime object
      DateTime now = DateTime.parse(datetime);

      // add the offset
      now = now.add(Duration(hours: offset));
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      time = 'Could not load data';
    }


  }

}

