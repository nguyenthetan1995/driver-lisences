
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_permissions/simple_permissions.dart';

class apppermission extends StatefulWidget {
  @override
  _apppermissionState createState() => _apppermissionState();
}

class _apppermissionState extends State<apppermission> {
  String _platformVersion;
  Permission permission;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intiplatform();
  }

  intiplatform() async {
    String platform;
    try {
      platform = await SimplePermissions.platformVersion;
    } on PlatformException {
      platform = "platform not found";
    }
    if (!mounted) return;
    setState(() => _platformVersion = platform);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('permission'),
        ),
        body: new Center(
          child: Column(
            children: <Widget>[
              new Text('Platform version is $_platformVersion\n'),
              new Divider(
                height: 10.0,
              ),
              new DropdownButton(
                  items: _getDropDownItems(),
                  value: permission,
                  onChanged: DropDownChanged),
              new Divider(
                height: 10.0,
              ),
              new RaisedButton(
                onPressed: checkpermission,
                child: new Text('Check permission'),
              ),
              new Divider(
                height: 10.0,
              ),
              new RaisedButton(
                onPressed: requestPermission,
                child: new Text('Request permission'),
              ),
              new Divider(
                height: 10.0,
              ),
              new RaisedButton(
                onPressed: getstatus,
                child: new Text('get status'),
              ),
              new Divider(
                height: 10.0,
              ),
              new RaisedButton(
                onPressed: SimplePermissions.openSettings,
                color: Colors.redAccent,
                child: new Text('Open setting'),
              )
            ],
          ),
        ),
      ),
    );
  }
  void DropDownChanged(Permission value) {
    setState(() {
      this.permission = value;
    });
    print(permission);
  }
  void checkpermission() async {
    bool result = await SimplePermissions.checkPermission(permission);
    print ("permission is "+result.toString());
  }
  void requestPermission() async{
    final result = await SimplePermissions.requestPermission(permission);
    print(" request: "+ result.toString());
  }
  void getstatus()async {
    final result = await SimplePermissions.getPermissionStatus(permission);
    print("permission status is: "+ result.toString());
  }

  List<DropdownMenuItem<Permission>> _getDropDownItems(){
    List<DropdownMenuItem<Permission>> items = new List();
    Permission.values.forEach((permission){
      var item = new DropdownMenuItem(
          child: new Text(getPermissionString(permission)),
          value: permission
      );
      items.add(item);
    });
    return items;
  }
}


