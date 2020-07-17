import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liên hệ'),
      ),
      body: new Container(
          padding: EdgeInsets.all(10.0),
          child:ListView(
            children: <Widget>[
              ListTile(
                title: new Text('tannt@vietmap.vn'),
              ),
              ListTile(
                title: new Text('3075743906'),
              ),
            ],
          )
      ),
    );
  }
}
