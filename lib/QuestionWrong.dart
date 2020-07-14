
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
    List<QuestionModel> listModelQuestion11 = [];
    List<QuestionModel> listModelQuestion121 = [];
    List<QuestionModel> listModelQuestion122 = [];
    List<QuestionModel> listModelQuestion13 = [];
    List<QuestionModel> listModelQuestion14 = [];
    List<QuestionModel> listModelQuestion2 = [];
    List<QuestionModel> listModelQuestion3 = [];
    List<QuestionModel> listModelQuestion4 = [];
    List<QuestionModel> listModelQuestion5 = [];
    List<QuestionModel> listModelQuestion6 = [];
    List<QuestionModel> listModelQuestion7 = [];
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
    print(listQuestionExam);
    return listQuestionExam;

  }
  @override
  Widget build(BuildContext context) {
    QuestionModel question;
    List<Widget> lstTabs = [];
    List<Widget> lstQues = [];
    TabController _controller;
    List<QuestionModel> listQuestionExam = [];
    if(testData.length==0)
    {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      );
    }

    for (int i = 0; i <testData.length; i ++){
      listQuestionExam=testData[i].Questions;
      for(int index = 0; i <listQuestionExam.length; index ++){

      }

      _controller = TabController(length: listQuestionExam.length,);
      lstTabs.add(
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Câu ${i + 1}/35',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      );


    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Câu hay sai'),
      ),
      body: Container(
        color: Colors.black12.withOpacity(0.1),
        child: new ListView(
          children: exams
        ),
      )
    );
  }
}
