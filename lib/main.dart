import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:test_license_driver/processdatabase.dart';
import 'homepage.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
 // Permission permission;
  @override
  _MyAppState createState() => _MyAppState();
}

class  _MyAppState extends State<MyApp> {
  @override
  setState(fn) async*{
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Thi Bằng Lái Xe",
      home: MyHomePage(),
    );
  }

}
