
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

class ListExamPage1 extends StatefulWidget {
  @override
  _ListExamPage1State createState() => _ListExamPage1State();
}

class _ListExamPage1State extends State<ListExamPage1> {
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
    if(dataText==null)
    {
      // TODO: Check List Test
      // TODO: Create List Test and save
      for (var i=0;i<19;i++)
      {
        var questions= await RamdomTestData();
        var testModel=new TestModel(
          id: i+1,number: i+1,Questions: questions,status: "Lam bai",
        );
        result.add(testModel);
      }
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
    List<QuestionModel> listModelQuestion = [];
    List<QuestionModel> listModelQuestion431 = [];
    List<QuestionModel> listModelQuestion432 = [];
    List<QuestionModel> listModelQuestion433 = [];
    List<QuestionModel> listModelQuestion44 = [];
    List<QuestionModel> listModelQuestion45 = [];
    List<QuestionModel> listModelQuestion4647 = [];
    List<QuestionModel> listModelQuestion48 = [];
    List<QuestionModel> listModelQuestion49 = [];
    List<QuestionModel> listQuestionExam = List<QuestionModel>();

    await initializeDatabase().then((v) async {
      listModelQuestion = await getAllListQuestion(v);

    });
    if (listModelQuestion.length != 0) {
      for (int i = 0; i < 21; i++) {
        listModelQuestion431.add(listModelQuestion[i]);
      }
      QuestionModel question431 =
      listModelQuestion431[Random().nextInt(listModelQuestion431.length)];
      listQuestionExam.add(question431);

      for (int i = 21; i < 131; i++) {
        listModelQuestion432.add(listModelQuestion[i]);
      }
      for (int i = 1; i <= 7; i++) {
        QuestionModel question432 =
        listModelQuestion432[Random().nextInt(listModelQuestion432.length)];
        listQuestionExam.add(question432);
      }

      for (int i = 131; i < 145; i++) {
        listModelQuestion433.add(listModelQuestion[i]);
      }
      QuestionModel question433 =
      listModelQuestion433[Random().nextInt(listModelQuestion433.length)];
      listQuestionExam.add(question433);

      for (int i = 145; i < 175; i++) {
        listModelQuestion44.add(listModelQuestion[i]);
      }
      QuestionModel question44 =
      listModelQuestion44[Random().nextInt(listModelQuestion44.length)];
      listQuestionExam.add(question44);

      for (int i = 175; i < 200; i++) {
        listModelQuestion45.add(listModelQuestion[i]);
      }
      QuestionModel question45 =
      listModelQuestion45[Random().nextInt(listModelQuestion45.length)];
      listQuestionExam.add(question45);

      for (int i = 200; i < 255; i++) {
        listModelQuestion4647.add(listModelQuestion[i]);
      }
      QuestionModel question4647 =
      listModelQuestion4647[Random().nextInt(listModelQuestion4647.length)];
      listQuestionExam.add(question4647);

      for (int i = 255; i < 355; i++) {
        listModelQuestion48.add(listModelQuestion[i]);
      }
      for (int i = 1; i <= 9; i++) {
        QuestionModel question48 =
        listModelQuestion48[Random().nextInt(listModelQuestion48.length)];
        listQuestionExam.add(question48);
      }

      for (int i = 355; i < 450; i++) {
        listModelQuestion49.add(listModelQuestion[i]);
      }
      for (int i = 1; i <= 9; i++) {
        QuestionModel question49 =
        listModelQuestion49[Random().nextInt(listModelQuestion49.length)];
        listQuestionExam.add(question49);
      }

    }
    return listQuestionExam;
  }
  @override
  Widget build(BuildContext context) {

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
      var test=testData[i];
      exams.add(
        Container(
          
          padding: const EdgeInsets.all(0.0),
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                return ExamPage(testModel: test,);
              }));
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.white,
                    Colors.white
                  ],
                ),
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 90.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 70.0,
                          margin: EdgeInsets.only(left: 10.0, right: 10.0),

                          height: 60,
                          child:Center(
                            child:Text('${test.number}', style: TextStyle(color: Colors.blue,fontFamily: 'city_boy', fontSize: 34.0),textAlign: TextAlign.center,)
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFe0f2f1)),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Đề số ${test.number} (30 câu)',
                        style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,),
                      ),
                      Text(
                        'Thời gian 30 phút',
                        style: TextStyle(fontSize: 16,
                            letterSpacing: 2.0,
                            color: Colors.black54,
                            height: 2.0),
                      ),
                    ],
                  ),
                  new Spacer(), // I just added one line
                  Icon(Icons.navigate_next, color: Colors.black45,
                    size: 35.0,)

                ],
              ),
            ),
          ),
        ),


      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Thi sát hạch'),
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
