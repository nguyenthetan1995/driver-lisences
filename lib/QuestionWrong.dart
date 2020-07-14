
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_license_driver/processdatabase.dart';

import 'exampage.dart';
import 'model/QuestionModel.dart';
import 'model/TestModel.dart';
import 'dart:convert';

class QuestionWrong extends StatefulWidget {
  @override
  _ListExamPage1State createState() => _ListExamPage1State();
}

class _ListExamPage1State extends State<QuestionWrong> {
  List<Widget> exams = [];
  QuestionModel question;
  List<Widget> lstTabs = [];
  List<Widget> bodyTabs = new List();
  TabController _controller;
  List<QuestionModel> listQuestionExam = [];
  String status = 'Làm bài';
  List<TestModel> testData = List<TestModel>();
  @override
  void initState() {
    super.initState();
    InitDataTest().then((v){
      setState(() {
        testData=v;
      });
    });
  }
  Future<List<TestModel>> InitDataTest()async{
    final prefs = await SharedPreferences.getInstance();
    String dataText = prefs.getString('testData');
    var result=List<TestModel>();
    dataText=null;
    if(dataText==null)
    {
      // TODO: Check List Test
      // TODO: Create List Test and save

      var questions= await RamdomTestData();

      var testModel=new TestModel(
        id: 1,number: 1,Questions: questions,status: "Lam bai",
      );
      result.add(testModel);

      var jsondata=result.map((f)=>f.toJson()).toList();
      prefs.setString('testData', json.encode(jsondata as List<Map>));
    }
    else
      {
        result=( json.decode(dataText) as List).map((f)=>TestModel.fromJson(f)).toList();

        // TODO: If has save : Load data
      }
    return result;
  }
  Future<List<QuestionModel>>  RamdomTestData() async
  {
    bool Isconnect = false;
    List<QuestionModel> listModelQuestion = [];

    List<QuestionModel> listQuestionExam = List<QuestionModel>();


    if(Isconnect == false){

      await initializeDatabase().then((v) async {
        listModelQuestion = await GetQuestionWrong(v);
        Isconnect = true;

      });
    }
    if (listModelQuestion.length != 0) {
      listQuestionExam = listModelQuestion;
    }
    return listQuestionExam;

  }

  @override
  Widget build(BuildContext context) {

    lstTabs.clear();
    bodyTabs.clear();
    for (int i = 0; i <testData.length; i ++){
      listQuestionExam=testData[i].Questions;
      if (listQuestionExam.length != 0) {
        for(int index = 0; index <listQuestionExam.length; index ++){
          lstTabs.add(Tab(text: 'Câu ${index +1}'));
          bodyTabs.add(
            Container(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'Câu ${index + 1}: ' + listQuestionExam[index].zQuestion ?? '',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    (listQuestionExam[index].zImageQuestion == '')
                        ? Container()
                        : Container(
                      height: 200,
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/imageapp/${listQuestionExam[index].zImageQuestion}"),
                              fit: BoxFit.contain)),
                    ),
                    new Divider(
                      indent: 0.0,
                      color: Colors.grey,
                      height: 0,
                    ),
                    (listQuestionExam[index].zAnswer == '1')
                        ? answerRight(listQuestionExam[index].zOption1,1)
                        : answerWrong(listQuestionExam[index].zOption1,1),
                    new Divider(
                      indent: 0.0,
                      color: Colors.grey,
                      height: 0,
                    ),
                    (listQuestionExam[index].zAnswer == '2')
                        ? answerRight(listQuestionExam[index].zOption2,2)
                        : answerWrong(listQuestionExam[index].zOption2,2),
                    new Divider(
                      indent: 0.0,
                      color: Colors.grey,
                      height: 0,
                    ),
                    (listQuestionExam[index].zOption3 == null || listQuestionExam[index].zOption3 == '')
                        ? Container()
                        : (listQuestionExam[index].zAnswer == '1')
                        ? answerRight(listQuestionExam[index].zOption3,3)
                        : answerWrong(listQuestionExam[index].zOption3,3),
                    new Divider(
                      indent: 0.0,
                      color: Colors.grey,
                      height: 0,
                    ),
                    (listQuestionExam[index].zOption4 == null || listQuestionExam[index].zOption4 == '')
                        ? Container()
                        : (listQuestionExam[index].zAnswer == '4')
                        ? answerRight(listQuestionExam[index].zOption4,4)
                        : answerWrong(listQuestionExam[index].zOption4,4),
                  ]
              )
            )
          );
        }
      }
    }
    return lstTabs.length ==0 ? Container()
        :DefaultTabController(
        length: lstTabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Câu hay sai',
                style: TextStyle(fontSize: 20.0),
              ),
              bottom:PreferredSize(
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.white.withOpacity(0.5),
                      indicatorColor: Colors.white,
                      tabs: lstTabs),
                  preferredSize: Size.fromHeight(40.0)
              ),
            ),
            body: TabBarView(children: bodyTabs))
      );
    }
  }

Widget answerWrong(String option,int number) {
  return InkWell (
    splashColor: Color.fromRGBO(3, 98, 252, 0.2),
    child: Container(
      padding: const EdgeInsets.only(bottom: 5.0,top: 5),
      child: Row(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                width: 40.0,
                height: 35,
                margin: const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
                decoration: new BoxDecoration(
                    color:  Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueAccent)),
              ),
              Text(number.toString() ,style: TextStyle(fontWeight: FontWeight.bold)

              )
            ],
          ),
          Expanded(
              child:  Text(option, style: TextStyle(fontSize: 15))
          )
        ],
      ),
    ),
  );
}

Widget answerRight(String option,int number) {
  return InkWell (
    splashColor: Color.fromRGBO(3, 98, 252, 0.2),
    child: Container(
      padding: const EdgeInsets.only(bottom: 5.0,top: 5),
      child: Row(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                width: 40.0,
                height: 35,
                margin: const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
                decoration: new BoxDecoration(
                    color:  Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueAccent)),
              ),
              Text(number.toString() ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)

              )
            ],
          ),
          Expanded(
              child:  Text(option, style: TextStyle(fontSize: 15, color: Colors.blue))
          )
        ],
      ),
    ),
  );

}