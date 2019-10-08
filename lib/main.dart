import 'package:flutter/material.dart';
import 'package:test_license_driver/processdatabase.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    initializeDatabase();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Thi Bằng Lái Xe",
      home: MyHomePage(),
    );
  }
}
