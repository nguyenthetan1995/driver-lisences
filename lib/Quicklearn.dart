
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_license_driver/processdatabase.dart';

import 'exampage.dart';
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
  List<Widget> lstTabs = [];
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
    dataText=null;
    if(dataText==null)
    {
      // TODO: Check List Test
      // TODO: Create List Test and save
      result= await GetQuicklearnData();
      for(var i = 0; i < result.length; i++){
        result[i].isExpanded = false;
      }
    }

    return result;
  }
  Future<List<QicklearnModel>>  GetQuicklearnData() async
  {
    bool Isconnect = false;
    List<QicklearnModel> listModelQuestion = [];

    List<QicklearnModel> listQuestionExam = List<QicklearnModel>();


    if(Isconnect == false){

      await initializeDatabase().then((v) async {
        listModelQuestion = await getAllListQicklearn(v);
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
    List<QicklearnModel> ListLearn   = testData;
    List<ExpansionPanel> ExpantionList = [];
    if(ListLearn.length !=  0){
      for(var i = 0; i < ListLearn.length; i++){
        ExpantionList.add(
            ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return  ListTile(
                      title:  Text(
                        'hello',
                        textAlign: TextAlign.left,
                        style:  TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                  );
                },
                isExpanded: ListLearn[i].isExpanded,
                body: Container(
                  child: Text(ListLearn[i].ZCONTENT),
                )
            )
        );
      }

    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Mẹo thi được điểm cao'),
      ),
      body: new ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  ListLearn[index].isExpanded = !ListLearn[index].isExpanded;
                });
              },
              children: ExpantionList,
            ),
          )
        ],
      ),
    );
  }


}