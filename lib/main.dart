import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_license_driver/processdatabase.dart';
import 'homepage.dart';
//import 'package:simple_permissions/simple_permissions.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
 // Permission permission;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);

    /*final res =SimplePermissions.requestPermission(widget.permission).then((value) {
      log('checkPermistion');
      print(value);
      return initializeDatabase();
    });*/


  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Thi Bằng Lái Xe",
      home: MyHomePage(),
    );
  }
}
