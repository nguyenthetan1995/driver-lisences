import 'package:flutter/material.dart';
import 'package:test_license_driver/exams.dart';
import 'package:test_license_driver/learnpage.dart';
import 'package:test_license_driver/signpage.dart';
import 'package:test_license_driver/time.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> options = [];
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  Color colorOption = Colors.lightBlue;
  double sizeOption = 40;
  @override
  Widget build(BuildContext context) {
    options.clear();
    options.add(
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LearningPage();
          }));
        },
        child: optionObject(OptionObject(
            iconOption:  Icons.book ,size: sizeOption,color: colorOption,
            textDescription: "Học lý thuyết")),
      ),
    );
    options.add(
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ListExamPage1();
          }));
        },
        child: optionObject(OptionObject(
            iconOption:  Icons.border_color ,size: sizeOption,color: colorOption,
            textDescription: "Thi theo bộ đề")),
      ),
    );
    options.add(
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SignPage();
          }));
        },
        child: optionObject(OptionObject(
            iconOption:  Icons.remove_circle ,size: sizeOption,color: colorOption,
            textDescription: "Biển báo giao thông")),
      ),
    );
    options.add(
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CountDownTime();
          }));
        },
        child: optionObject(OptionObject(
          iconOption:  Icons.shuffle ,size: sizeOption,color: colorOption,
            textDescription: "Đề thi ngẫu nhiên")),
      ),
    );
    options.add(
      GestureDetector(
/*        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SignPage();
          }));
        },*/
        child: optionObject(OptionObject(
            iconOption:  Icons.priority_high ,size: sizeOption,color: colorOption,
            textDescription: "Mẹo thi kết quả cao")),
      ),
    );
    options.add(
      GestureDetector(
/*        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SignPage();
          }));
        },*/
        child: optionObject(OptionObject(
            iconOption:  Icons.search ,size: sizeOption,color: Colors.blue,
            textDescription: "Tra cứu luật nhanh")),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ôn thi GPLX B2',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,

        children: <Widget>[
          Container(
            height: 120.0,
            child: new ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                new Container(
                  width:  MediaQuery.of(context).size.width,
                  height: 120.0,
                  color: Colors.red,
                  child: new Center(
                    child:Image(image: AssetImage( '568.webp'))
                  ),
                ),
                new Container(
                    width:  MediaQuery.of(context).size.width,
                    height:120.0,
                    color: Colors.blue,
                    child: new Center(
                      child: Image(image: AssetImage( '569.webp'))
                    )
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0,right: 10.0),
            height: (MediaQuery.of(context).size.height/2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      padding: const EdgeInsets.all(4.0),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      children: options
                  ),
                ),

              ],
            ),
          ),
        ],
      )
    );
  }
}

class OptionObject {
  OptionObject({
    this.iconOption,
    this.textDescription,
    this.color,this.size
  });
  IconData iconOption;
  String textDescription;
  Color color;
  double size;
}

Widget optionObject(OptionObject option) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
//          color: Colors.orange,
          child: Center(
            child: new Icon(option.iconOption,color: option.color,size: option.size,),
//            child: option.iconOption
          ),
        ),
        Container(
          height: 50,
//          color: Colors.green,
          child: Center(
            child: Text(
              option.textDescription,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  );
}
