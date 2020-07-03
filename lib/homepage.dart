import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_license_driver/exams.dart';
import 'package:test_license_driver/learnpage.dart';
import 'package:test_license_driver/signpage.dart';
import 'package:test_license_driver/time.dart';
import 'package:image_auto_slider/image_auto_slider.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

GlobalKey slidekey = GlobalKey();
class _MyHomePageState extends State<MyHomePage> {
  List<Widget> options = [];
  Drawer _drawerbuild(context){
    return new Drawer(
        child:new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Container(
                child: new Column(
                  children: <Widget>[

                  ],
                ),
              ),
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background/background-01.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            new Container(
              color: Colors.lightBlue,
              child: new ListTile(
                leading: new Icon(Icons.home, color: Colors.white),
                title: new Text('Trang chủ', style: TextStyle(color: Colors.white)),
                onTap: (){
                  setState(() {

                  });
                },
              ),
            ),

            new ListTile(
              leading: new Icon(Icons.help),
              title: new Text('Hướng dẫn sử dụng'),
              onTap: (){
                setState(() {

                });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('Hỗ trợ'),
              onTap: (){
                setState(() {

                });
              },
            ),
            new Divider(
              indent: 16.0,
              color: Colors.grey,
            ), new ListTile(
              leading: new Icon(Icons.settings),
              title: new Text('Cài đặt'),
            ),
            new ListTile(
              leading: new Icon(Icons.thumb_up),
              title: new Text('Đánh giá'),
            ),
            new ListTile(
              leading: new Icon(Icons.share),
              title: new Text('Chia sẻ'),
            ),
            new ListTile(
              leading: new Icon(Icons.people),
              title: new Text('Chính sách điều khoản'),
            ),
          ],
        )
    );
  }
  Color colorOption = Colors.lightBlue;
  double sizeOption = 10;
  @override
  Widget build(BuildContext context) {
    options.clear();
    options.add(
        Stack(
        alignment: new Alignment(0.0, 0.9),
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LearningPage();
              }));
            },
            child: new Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54.withOpacity(0.7),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(3.0, 3.0),// changes position of shadow
                  ),
                ],
              ),
                child: new Container(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 49.0, top:14.0),
                    child: new Image.asset('assets/imghome/book.png',fit: BoxFit.fill,)
                )
            ),
          ),
          //Container(height: 30,color: Colors.blue,),

          new Container(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0, bottom: 7.0),
            decoration: new BoxDecoration(

            ),
            child: new Text('Học lý thuyết', style:new TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          )

        ]
    ));
    options.add(
        Stack(
            alignment: new Alignment(0.0, 0.9),
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListExamPage1();
                  }));
                },
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(3.0, 3.0), // changes position of shadow
                      ),
                    ],
                  ),
                    child: new Container(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 49.0, top:14.0),
                        child: new Image.asset('assets/imghome/book_2.png',fit: BoxFit.fill,)
                    )
                ),
              ),
              //Container(height: 30,color: Colors.blue,),

              new Container(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0, bottom: 7.0),
                decoration: new BoxDecoration(

                ),
                child: new Text('Thi theo bộ đề', style:new TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              )

            ]
    ));

    options.add(
        Stack(
            alignment: new Alignment(0.0, 0.9),
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignPage();
                  }));
                },
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(3.0, 3.0), // changes position of shadow
                      ),
                    ],
                  ),
                    child: new Container(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 49.0, top:14.0),
                        child: new Image.asset('assets/imghome/traffic_sign.png',fit: BoxFit.fill,)
                    )
                ),
              ),
              //Container(height: 30,color: Colors.blue,),

              new Container(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0, bottom: 3.0),
                decoration: new BoxDecoration(

                ),
                child: new Text('Biển báo giao thông', style:new TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              )

            ]
    ));
    options.add(
        Stack(
            alignment: new Alignment(0.0, 0.9),
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CountDownTime();
                  }));
                },
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(3.0, 3.0), // changes position of shadow
                      ),
                    ],
                  ),
                    child: new Container(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 49.0, top:14.0),
                        child: new Image.asset('assets/imghome/random.png',fit: BoxFit.fill,)
                    )
                ),
              ),
              //Container(height: 30,color: Colors.blue,),

              new Container(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0, bottom: 3.0),
                decoration: new BoxDecoration(

                ),
                child: new Text('Đề thi ngẫu nhiên', style:new TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              )

            ]
    ));
    options.add(
        Stack(
            alignment: new Alignment(0.0, 0.9),
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignPage();
                  }));
                },
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(3.0, 3.0),// changes position of shadow
                      ),
                    ],
                  ),
                  child: new Container(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 42.0, top:12.0),
                    child: new Image.asset('assets/imghome/light.png',fit: BoxFit.fill,)
                  )
                ),
              ),
              //Container(height: 30,color: Colors.blue,),

              new Container(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0, ),
                decoration: new BoxDecoration(
                ),
                child: new Text('Mẹo thi kết quả cao', style:new TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              )

            ]
    ));
    options.add(
        Stack(
            alignment: new Alignment(0.0, 0.9),
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignPage();
                  }));
                },
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(3.0, 3.0), // changes position of shadow
                      ),
                    ],
                  ),
                    child: new Container(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 47.0, top:12.0),
                        child: new Image.asset('assets/imghome/search.png',fit: BoxFit.fill,)
                    )
                ),
              ),
              //Container(height: 30,color: Colors.blue,),

              new Container(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0, bottom: 3.0),
                decoration: new BoxDecoration(

                ),
                child: new Text('Tra cứu luật nhanh', style:new TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              )

            ]
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ôn thi GPLX B2',
        ),
        centerTitle: true,

      ),
      drawer:_drawerbuild(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,

        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/4,
            child: new ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[

                new Container(
                    width:  MediaQuery.of(context).size.width,
                    height:120.0,
                    color: Colors.blue,
                    child: ImageAutoSlider(
                      assetImages: [
                        AssetImage('assets/background/background-01.jpg'),
                        AssetImage('assets/img2.jpg'),
                        AssetImage('assets/img3.jpeg')
                      ],
                      imageHeight: 120.0,
                      boxFit: BoxFit.fitWidth,
                      slideMilliseconds: 700,
                      durationSecond: 3,
                    ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background/blue.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            padding: EdgeInsets.only(top: 15.0,),
            key: slidekey,
            height:MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height/4)-56.0-24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    padding: const EdgeInsets.only(top:10.0, left: 70.0, right: 70.0),
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 40.0,
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
