import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MainPageState extends State<Drawmenu>{
    Drawer _drawerbuild(context){
    return new Drawer(
      child:new ListView(
        children: <Widget>[
          new DrawerHeader(
              child: new Container(
                child: new Column(
                  children: <Widget>[
                    new Text('Nguyen The Tan',style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.blue
              ),
          ),
          new ListTile(
            leading: new Icon(Icons.photo),
            title: new Text('Trang chủ'),
            onTap: (){
              setState(() {

              });
            },
          ),
          new ListTile(
            leading: new Icon(Icons.contacts),
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
          ),
          new ListTile(
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Drawer'),
      ),
      body: new Center(
        child: new Text('this.title'),
      ),
      drawer: _drawerbuild(context),
    );
  }
}
class Drawmenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainPageState();
  }
}