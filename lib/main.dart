import 'dart:developer';
import 'package:permissions_plugin/permissions_plugin.dart';
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

class  _MyAppState extends State<MyApp> {
  @override
  setState(fn) async*{
    // TODO: implement setState
    super.setState(fn);
    /*PermissionStatus permissionResult = await SimplePermissions.requestPermission(Permission. WriteExternalStorage);
    if (permissionResult == PermissionStatus.authorized){
      initializeDatabase();
    }*/
    /*final res =SimplePermissions.requestPermission(widget.permission).then((value) {
      log('checkPermistion');
      print(value);
      return initializeDatabase();
    });*/


  }
  @override
  Widget build(BuildContext context) {
    checkPermissions(context);
    return MaterialApp(
      title: "Thi Bằng Lái Xe",
      home: MyHomePage(),
    );
  }

  Future<void> checkPermissions(BuildContext context) async {

    final PermissionState aks = await PermissionsPlugin.isIgnoreBatteryOptimization;

    PermissionState resBattery;
    if(aks != PermissionState.GRANTED)
      resBattery = await PermissionsPlugin.requestIgnoreBatteryOptimization;

    print(resBattery);

    Map<Permission, PermissionState> permission = await PermissionsPlugin
        .checkPermissions([
      Permission.ACCESS_FINE_LOCATION,
      Permission.ACCESS_COARSE_LOCATION,
      Permission.READ_PHONE_STATE
    ]);

    if( permission[Permission.ACCESS_FINE_LOCATION] != PermissionState.GRANTED ||
        permission[Permission.ACCESS_COARSE_LOCATION] != PermissionState.GRANTED ||
        permission[Permission.READ_PHONE_STATE] != PermissionState.GRANTED ) {

      try {
        permission = await PermissionsPlugin
            .requestPermissions([
          Permission.ACCESS_FINE_LOCATION,
          Permission.ACCESS_COARSE_LOCATION,
          Permission.READ_PHONE_STATE
        ]);
      } on Exception {
        debugPrint("Error");
      }

      if( permission[Permission.ACCESS_FINE_LOCATION] == PermissionState.GRANTED &&
          permission[Permission.ACCESS_COARSE_LOCATION] == PermissionState.GRANTED &&
          permission[Permission.READ_PHONE_STATE] == PermissionState.GRANTED )
        print("Login ok");
      else
        permissionsDenied(context);

    } else {
      print("Login ok");
    }
  }

  void permissionsDenied(BuildContext context){
    showDialog(context: context, builder: (BuildContext _context) {
      return SimpleDialog(
        title: const Text("Permisos denegados"),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
            child: const Text(
              "Debes conceder todo los permiso para poder usar esta aplicacion",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54
              ),
            ),
          )
        ],
      );
    });
  }
}
