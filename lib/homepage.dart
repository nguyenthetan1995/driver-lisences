import 'package:flutter/material.dart';
import 'package:hoclaixe/db.dart';
import 'package:hoclaixe/listexam.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Ôn thi GPLX B2',
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/365.png"), fit: BoxFit.fill)),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
//                                initializeDatabase();
                        return ListExamPage();
                      }));
                      initializeDatabase();
                      print('123');
                    },
                    child: optionObject(OptionObject(
                        iconOption: Icon(
                          Icons.border_color,
                          size: 40,
                          color: Colors.lightBlue,
                        ),
                        textDescription: "Thi sát hạch")),
                  ),
                  optionObject(OptionObject(
                      iconOption: Icon(
                        Icons.book,
                        size: 40,
                        color: Colors.lightBlue,
                      ),
                      textDescription: "Học lý thuyết")),
                  optionObject(OptionObject(
                      iconOption: Icon(
                        Icons.directions_bike,
                        size: 40,
                        color: Colors.lightBlue,
                      ),
                      textDescription: "Biển báo giao thông")),
                ],
              ),
            )
          ],
        ));
  }
}

class OptionObject {
  OptionObject({
    this.iconOption,
    this.textDescription,
  });
  Icon iconOption;
  String textDescription;
}

Widget optionObject(OptionObject option) {
  return Container(
    padding: EdgeInsets.all(5),
    height: 110,
    width: 125,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 40,
          child: Center(
            child: option.iconOption,
          ),
        ),
        Container(
          height: 50,
          child: Center(
            child: Text(
              option.textDescription,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    ),
  );
}
