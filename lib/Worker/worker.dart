import 'package:http/http.dart';
import 'dart:convert';

class worker {
  final String location;

  // Constructor
  worker({required this.location});

  String temp = "NA";
  String humidity = "NA";
  String air_speed = "NA";
  String description = "Can't Find Data";
  String main = "NA";
  String icon = "09d";

  // Method
  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$location&appid=c0c9f355ef28785a8be90ec396b30dc2"));
      Map data = jsonDecode(response.body);

      // Getting Temp, Humidity
      Map tempData = data['main'];
      String getHumidity = tempData['humidity'].toString();
      double getTemp = tempData['temp'] - 273.15;

      // Getting air_speed
      Map wind = data['wind'];
      double getAirSpeed = wind["speed"] / 0.27777777777778;

      // Getting Description
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMainDes = weatherMainData['main'];
      String getDesc = weatherMainData["description"];

      // Assigning Values
      temp = getTemp.toStringAsFixed(2); // C
      humidity = getHumidity; // %
      air_speed = getAirSpeed.toStringAsFixed(2); // km/hr
      description = getDesc;
      main = getMainDes;
      icon = weatherMainData["icon"].toString();
    } catch (e) {
      print(e);
    }
  }
}