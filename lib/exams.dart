
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
    dataText=null;
    if(dataText==null)
    {
      // TODO: Check List Test
      // TODO: Create List Test and save
      for (var i=0;i<20;i++)
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
        listModelQuestion = await getAllListQuestion(v);
        Isconnect = true;

      });
    }
    if (listModelQuestion.length != 0) {
      //1 Câu KN
      for (int i = 0; i < 16; i++) {
        listModelQuestion11.add(listModelQuestion[i]);
      }
      QuestionModel question11 =
      listModelQuestion11[Random().nextInt(listModelQuestion11.length)];
      listQuestionExam.add(question11);
      //7 Câu quy tắc GT
      for (int i = 17; i < 123; i++) {
        listModelQuestion121.add(listModelQuestion[i]);
      }
      for(int i = 0; i < 6 ; i++){
        QuestionModel question12 =
        listModelQuestion121[Random().nextInt(listModelQuestion121.length)];
        listQuestionExam.add(question12);
      }
      for (int i = 140; i < 160; i++) {
        listModelQuestion122.add(listModelQuestion[i]);
      }
      QuestionModel question122 =
      listModelQuestion122[Random().nextInt(listModelQuestion122.length)];
      listQuestionExam.add(question122);
      //1 Câu về tình huống an toàn
      for (int i = 160; i < 166; i++) {
        listModelQuestion13.add(listModelQuestion[i]);
      }
      QuestionModel question13 =
      listModelQuestion13[Random().nextInt(listModelQuestion13.length)];
      listQuestionExam.add(question13);
      //1 Câu về tốc độ
      for (int i = 124; i < 140; i++) {
        listModelQuestion14.add(listModelQuestion[i]);
      }
      QuestionModel question14 =
      listModelQuestion14[Random().nextInt(listModelQuestion14.length)];
      listQuestionExam.add(question14);

      //1 Câu nghiệp vụ vận tải
      for (int i = 167; i < 193; i++) {
        listModelQuestion2.add(listModelQuestion[i]);
      }
      QuestionModel question2 =
      listModelQuestion2[Random().nextInt(listModelQuestion2.length)];
      listQuestionExam.add(question2);

      //1 Câu về văn hóa, đạo đức người lái xe.
      for (int i = 193; i < 213; i++) {
        listModelQuestion3.add(listModelQuestion[i]);
      }
      QuestionModel question3 =
      listModelQuestion3[Random().nextInt(listModelQuestion3.length)];
      listQuestionExam.add(question3);
      //2 Câu về kỹ thuật lái xe
      for (int i = 214; i < 269; i++) {
        listModelQuestion4.add(listModelQuestion[i]);
      }
      for (int i = 1; i <= 2; i++) {
        QuestionModel question4 =
        listModelQuestion4[Random().nextInt(listModelQuestion4.length)];
        listQuestionExam.add(question4);
      }
      //1 Câu sửa chữa xe
      for (int i = 270; i < 304; i++) {
        listModelQuestion5.add(listModelQuestion[i]);
      }
      QuestionModel question5 =
      listModelQuestion5[Random().nextInt(listModelQuestion5.length)];
      listQuestionExam.add(question5);
      //10 Câu biển báo GT
      for (int i = 305; i < 486; i++) {
        listModelQuestion6.add(listModelQuestion[i]);
      }
      for (int i = 1; i <= 10; i++) {
        QuestionModel question6 =
        listModelQuestion6[Random().nextInt(listModelQuestion6.length)];
        listQuestionExam.add(question6);
      }

      //10 Câu về sa hình
      for (int i = 487; i < 600; i++) {
        listModelQuestion7.add(listModelQuestion[i]);
      }
      for (int i = 1; i <= 10; i++) {
        QuestionModel question7 =
        listModelQuestion7[Random().nextInt(listModelQuestion7.length)];
        listQuestionExam.add(question7);
      }

      /*for (int i = 355; i < 450; i++) {
        listModelQuestion49.add(listModelQuestion[i]);
      }
      for (int i = 1; i <= 9; i++) {
        QuestionModel question49 =
        listModelQuestion49[Random().nextInt(listModelQuestion49.length)];
        listQuestionExam.add(question49);
      }*/

    }
    print(listQuestionExam);
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
                          child:Stack(
                            children: <Widget>[
                              Container(
                                child:Text('${test.number}', style: TextStyle(color: Colors.blue,fontFamily: 'city_boy', fontSize: 34.0),textAlign: TextAlign.center,),
                                padding: EdgeInsets.only(bottom: 4.0, right: 7.0),
                                alignment: Alignment.center,
                              ),
                              GestureDetector(
                                child: new Image.asset('assets/imghome/circle.png',fit: BoxFit.fill,)
                              )

                            ]
                          ),

                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Đề số ${test.number} (35 câu)',
                        style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,),
                      ),
                      Text(
                        'Thời gian 22 phút',
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
