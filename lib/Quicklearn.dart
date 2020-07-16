
import 'dart:convert';
import 'dart:math';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_license_driver/processdatabase.dart';
import 'exampage.dart';
import 'model/DataQicklearn.dart';
import 'model/QuickleanModel.dart';
import 'model/TestModel.dart';
import 'dart:convert';

class Quicklearn extends StatefulWidget {
  @override
  _ListExamPage1State createState() => _ListExamPage1State();
}

class _ListExamPage1State extends State<Quicklearn> {
  List<Widget> exams = [];
  QicklearnModel question;
  List<LearnQickContent> Datalearn = List<LearnQickContent>();
  List<LearnQickContent> Practicing = List<LearnQickContent>();
  List<Widget> bodyTabs = new List();
  TabController _controller;
  List<QicklearnModel> listQuestionExam = [];
  String status = 'Làm bài';

  List<QicklearnModel> testData = List<QicklearnModel>();
  @override
  void initState() {
    super.initState();
    InitDataTest().then((v){
      setState(() {
        testData=v;
      });
    });
  }
  Future<List<QicklearnModel>> InitDataTest()async{
    final prefs = await SharedPreferences.getInstance();
    String dataText = prefs.getString('testData');
    var result=List<QicklearnModel>();
    var data = List<LearnQickContent>();
    dataText=null;
    if(dataText==null)
    {
      // TODO: Check List Test
      // TODO: Create List Test and save
       data = await loadJson();
      Practicing = await loadJsonPractic();
      if(data is List<LearnQickContent>)
      {
        Datalearn = data;
      }
      result= await GetQuicklearnData();
    }
    return result;
  }

  Future<List<LearnQickContent>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/datalearn.json');
    var jsonResponse = json.decode(jsonString);
    if(jsonResponse is List){
      List<LearnQickContent> myList = jsonResponse.map(
              (jsonElement) =>  LearnQickContent.fromJSON(jsonElement)
      ).toList();
      return myList;
    }
   return new List<LearnQickContent>();
  }
  Future<List<LearnQickContent>> loadJsonPractic() async {
    String jsonString = await rootBundle.loadString('assets/Datapracticing.json');
    var jsonResponse = json.decode(jsonString);
    if(jsonResponse is List){
      List<LearnQickContent> myList = jsonResponse.map(
              (jsonElement) =>  LearnQickContent.fromJSON(jsonElement)
      ).toList();
      return myList;
    }
    return new List<LearnQickContent>();
  }
  Future<List<QicklearnModel>>  GetQuicklearnData() async
  {
    bool Isconnect = false;
    List<QicklearnModel> listModelQuestion = List<QicklearnModel>();

    List<QicklearnModel> listQuestionExam = List<QicklearnModel>();

    if(Isconnect == false){

      await initializeDatabase().then((v) async {
        listModelQuestion = await getAllListQicklearn(v);
        Isconnect = true;

      });
    }
    //listModelQuestion = await getDataQuickLearn();
    if (listModelQuestion.length != 0) {
      listQuestionExam = listModelQuestion;
    }

    return listQuestionExam;
  }

  @override
  Widget build(BuildContext context) {
    List<QicklearnModel> ListLearn   = testData;
    List<bool> Pansion   = [];
    List<ExpansionPanel> ExpantionList = [];
    List<ExpansionPanel> ExpantionListPractic = [];
    if(Datalearn.length != 0){
      for(var i = 0;i < Datalearn.length; i++){
        if(Datalearn[i].isExpan != null){
          ExpantionList.add(
              ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title:  Text(
                            Datalearn[i].Content,
                            textAlign: TextAlign.left,
                            style:  TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ),

                      ],
                    );
                  },
                  canTapOnHeader:true,
                  isExpanded: Datalearn[i].isExpan,
                  body: Container(
                    margin: EdgeInsets.only(left:15.0, right:10.0,bottom: 20.0),
                    child: ContentQuicklearn(testData,i),
                  )
              )
          );
        }
      }
    }
    if(Practicing.length != 0){
      for(var i = 0;i < Practicing.length; i++){
        if(Practicing[i].isExpan != null){
          ExpantionListPractic.add(
              ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                            title:  Text(
                              Practicing[i].Content,
                              textAlign: TextAlign.left,
                              style:  TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                        ),

                      ],
                    );
                  },
                  canTapOnHeader:true,
                  isExpanded: Practicing[i].isExpan,
                  body: Container(
                    margin: EdgeInsets.only(left:15.0, right:10.0,bottom: 20.0),
                    child: BuildPraticing(testData,i),
                  )
              )
          );
        }
      }
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mẹo thi được điểm cao'),
          bottom: TabBar(
              indicatorPadding: EdgeInsets.all(0),
              labelPadding: EdgeInsets.all(0),
              isScrollable: true,
              tabs: [
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: Tab(text: 'Thi lý thuyết'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: Tab(text: 'Thi thực hành'),
                )
              ]
          )
        ),
        body: TabBarView(
          children: [
            ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      child:  ExpansionPanelList(
                          expandedHeaderPadding: EdgeInsets.all(0),
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              Datalearn[index].isExpan = !Datalearn[index].isExpan;
                            });
                          },
                          children: ExpantionList
                      ),
                    )
                ),

              ],
            ),
            ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      child:  ExpansionPanelList(
                          expandedHeaderPadding: EdgeInsets.all(0),
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              Practicing[index].isExpan = !Practicing[index].isExpan;
                            });
                          },
                          children: ExpantionListPractic
                      ),
                    )
                ),

              ],
            ),
          ],
        ),
      ),
    );

  }
  Widget ContentQuicklearn(List<QicklearnModel> ListLearn,int number) {
    List<QicklearnModel> data = new List<QicklearnModel>();
    if(ListLearn.length !=  0){

      if(number==0){
        for(var i = 0; i < 19; i++){
          data.add(ListLearn[i]);
        }
      }
      if(number==1){
        for(var i = 19; i < 25; i++){
          data.add(ListLearn[i]);
        }
      }
      if(number==2){
        for(var i = 25; i < 28; i++){
          data.add(ListLearn[i]);
        }
      }
      if(number==3){
        for(var i = 28; i < 46; i++){
          data.add(ListLearn[i]);
        }
      }
      if(number==4){
        for(var i = 46; i < 49; i++){
          data.add(ListLearn[i]);
        }
      }
      if(number==5){
        for(var i = 49; i < 57; i++){
          data.add(ListLearn[i]);
        }
      }
    }
    List<Widget> Content = List<Widget>();
    for(var i = 0; i < data.length; i++){
       var cont = new RichText(
         text: new TextSpan(
           // Note: Styles for TextSpans must be explicitly defined.
           // Child text spans will inherit styles from parent
           style: new TextStyle(
             fontSize: 14.0,
             color: Colors.black,
           ),
           children: <TextSpan>[
             new TextSpan(text: '${i+1}. ', style: TextStyle(fontWeight: FontWeight.bold,height: 1.7)),
             new TextSpan(text: data[i].ZCONTENT, style: TextStyle(height: 1.7),),
           ],
         ),
       );
      Content.add(cont);
    }
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:Content
      ),
    );
  }
  Widget BuildPraticing(List<QicklearnModel> Practic,int number) {
    List<QicklearnModel> data = new List<QicklearnModel>();
    if(Practic.length !=  0){
      if(number == 0 ){
        data.add(Practic[57]);
      }
      if(number == 1 ){
        data.add(Practic[58]);
      }
      if(number == 2 ){
        data.add(Practic[59]);
      }
      if(number == 3 ){
        data.add(Practic[60]);
      }
      if(number == 4 ){
        data.add(Practic[61]);
      }
      if(number == 5 ){
        data.add(Practic[62]);
      }
      if(number == 6 ){
        data.add(Practic[63]);
      }
      if(number == 7 ){
        data.add(Practic[64]);
      }
      if(number == 8 ){
        data.add(Practic[65]);
      }
      if(number == 9 ){
        data.add(Practic[66]);
      }
      if(number == 10 ){
        data.add(Practic[67]);
      }
      if(number == 11 ){
        data.add(Practic[68]);
      }
      if(number == 12 ){
        data.add(Practic[69]);
      }

    }
    List<Widget> Content = List<Widget>();
    for(var i = 0; i < data.length; i++){
      var cont = new RichText(
        text: new TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
          style: new TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            new TextSpan(text: '${i+1}. ', style: TextStyle(fontWeight: FontWeight.bold,height: 1.7)),
            new TextSpan(text: data[i].ZCONTENT, style: TextStyle(height: 1.7),),
          ],
        ),
      );
      Content.add(cont);
    }
    return Container(
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:Content
      ),
    );
  }
}