import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_license_driver/exams.dart';
import 'package:test_license_driver/learnpage.dart';
import 'package:test_license_driver/signpage.dart';
import 'package:test_license_driver/time.dart';
import 'examsramdom.dart';
import 'QuestionWrong.dart';
import 'package:image_auto_slider/image_auto_slider.dart';
import 'Quicklearn.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'Help.dart';
import 'Contact.dart';
import 'ShareApp.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter_share/flutter_share.dart';
import 'permission.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

GlobalKey slidekey = GlobalKey();
class _MyHomePageState extends State<MyHomePage> {
  void _showRatingDialog() {
    // We use the built in showDialog function to show our Rating Dialog
    showDialog(
        context: context,
        barrierDismissible: true, // set to false if you want to force a rating
        builder: (context) {
          return RatingDialog(
            icon: const FlutterLogo(
                size: 100,
                colors: Colors.blue), // set your own image/icon widget
            title: "Đánh giá ứng dụng",
            description:
            "Chọn số sao để đánh giá về ứng dụng của chúng tôi. Xin cảm ơn!",
            submitButton: "Đồng ý",
            alternativeButton: "Liên hệ với chúng tôi?", // optional
            positiveComment: "Cảm ơn bạn đã đánh giá ứng dụng", // optional
            negativeComment: "We're sad to hear :(", // optional
            accentColor: Colors.red, // optional
            onSubmitPressed: (int rating) {
              print("onSubmitPressed: rating = $rating");
              // TODO: open the app's page on Google Play / Apple App Store
            },
            onAlternativePressed: () {
              print("onAlternativePressed: do something");
              // TODO: maybe you want the user to contact you instead of rating a bad review
            },
          );
        });
  }
  List<Widget> options = [];
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Chọn ứng dụng chia sẻ',
        text:'',
        chooserTitle: 'Chọn ứng dụng chia sẻ'
    );
  }
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //return apppermission();
                    }));
                  });
                },
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.help),
              title: new Text('Hướng dẫn sử dụng'),
              onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Hepl();
                  }));
                });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('Hỗ trợ'),
              onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Contact();
                  }));
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
              onTap: (){
                _showRatingDialog();
              },
            ),
            new ListTile(
              leading: new Icon(Icons.share),
              title: new Text('Chia sẻ'),
              onTap: (){
                setState(() {
                  share();
                });
              },
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

    options.add(Container(
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
            color: Colors.black12.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(6.0, 6.0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LearningPage();
              }));
            },
            child: new Container(
                child:  Container(
                    padding: EdgeInsets.only(top:10.0, bottom: 5.0),
                    height: 55,
                    width: 70,
                    child:new Image.asset('assets/imghome/book.png',fit: BoxFit.contain,)
                )
            ),
          ),
          //Container(height: 30,color: Colors.blue,),
          Expanded(
            child:new Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child:Center(
                    child: AutoSizeText(
                      'Học lý thuyết',
                      style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                )
            )
          )
        ],
      ),
    ));
    options.add(Container(
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
            color: Colors.black12.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(6.0, 6.0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListExamPage1();
              }));
            },
            child: new Container(
                child:  Container(
                    padding: EdgeInsets.only(top:10.0, bottom: 5.0),
                    height: 55,
                    width: 70,
                    child:new Image.asset('assets/imghome/book_2.png',fit: BoxFit.contain,)
                )
            ),
          ),
          //Container(height: 30,color: Colors.blue,),
          Expanded(
            child:new Container(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child:Center(
                  child: AutoSizeText(
                    'Thi theo bộ đề',
                    style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
              )
            )
          )
        ],
      ),
    ));
    options.add(Container(
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
            color: Colors.black12.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(6.0, 6.0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignPage();
              }));
            },
            child: new Container(
                child:  Container(
                    padding: EdgeInsets.only(top:5.0, bottom: 5.0),
                    height: 55,
                    width: 70,
                    child:new Image.asset('assets/imghome/traffic_sign.png',fit: BoxFit.contain,)
                )
            ),
          ),
          //Container(height: 30,color: Colors.blue,),
          Expanded(
            child:new Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child:Center(
                    child:  AutoSizeText(
                      'Biển báo giao thông',
                      style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    )
                )
            )
          )

        ],
      ),
    ));
    options.add(Container(
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
            color: Colors.black12.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(6.0, 6.0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Examsramdom();
              }));
            },
            child: new Container(
                child:  Container(
                    padding: EdgeInsets.only(top:10.0, bottom: 5.0),
                    height: 55,
                    width: 70,
                    child:new Image.asset('assets/imghome/random.png',fit: BoxFit.contain,)
                )
            ),
          ),
          //Container(height: 30,color: Colors.blue,),
          Expanded(
            child:new Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child:Center(
                    child: AutoSizeText(
                      'Đề thi ngẫu nhiên',
                      style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    )
                )
            )
          )
        ],
      ),
    ));
    options.add(Container(
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
            color: Colors.black12.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(6.0, 6.0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Quicklearn();
              }));
            },
            child: new Container(
                child:  Container(
                    padding: EdgeInsets.only(top:10.0, bottom: 5.0),
                    height: 55,
                    width: 70,
                    child:new Image.asset('assets/imghome/light.png',fit: BoxFit.contain,)
                )
            ),
          ),
          //Container(height: 30,color: Colors.blue,),
          Expanded(
            child:new Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child:Center(
                    child: AutoSizeText(
                      'Mẹo thi kết quả cao',
                      style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    )
                )
            )
          )
        ],
      ),
    ));
    options.add(Container(
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
            color: Colors.black12.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(6.0, 6.0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return QuestionWrong();
              }));
            },
            child: new Container(
                child:  Container(
                    padding: EdgeInsets.only(top:10.0, bottom: 5.0),
                    height: 55,
                    width: 70,
                    child:new Image.asset('assets/imghome/wrong.png',fit: BoxFit.contain,)
                )
            ),
          ),
          //Container(height: 30,color: Colors.blue,),
          Expanded(
              child:new Container(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child:Center(
                      child: AutoSizeText(
                        'Câu hay sai',
                        style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      )
                  )
              )
          )
        ],
      ),
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
                        AssetImage('assets/background/Background-02.png')
                      ],
                      imageHeight: 120.0,
                      boxFit: BoxFit.fill,
                      slideMilliseconds: 700,
                      durationSecond: 3,
                    ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background/blue.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              padding: EdgeInsets.only(top: 15.0,),
              key: slidekey,
              height:MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height/4)-56.0-34.0,
              child: Center(
                child:
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                        padding: const EdgeInsets.only(top:10.0, left: 60.0, right: 60.0),
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 40.0,
                        children: options
                    ),
                  ),

              ),
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

