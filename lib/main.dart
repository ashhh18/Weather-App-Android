import 'package:flutter/material.dart';
import 'package:please/Activity/home.dart';
import 'package:please/Activity/loading.dart';



void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/loading" : (context) => Loading(),
    },
  ));
}
