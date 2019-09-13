import 'package:flutter/material.dart';
import 'package:test_license_driver/model/QuestionModel.dart';
import 'learnquestion.dart';
import 'model/QuestionTypeModel.dart';
import 'processdatabase.dart';

class LearningPage extends StatefulWidget {
  @override
  _LearningPageState createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  List<QuestionTypeModel> listModelQuestionType;
  List listQuestionType = [];
  List<QuestionModel> listQuestionModel;
  QuestionModel question;
  QuestionTypeModel quesType;

  @override
  void initState() {
    super.initState();
    initializeDatabase().then((v) async {
      this.listModelQuestionType = await getListQuestionType(v);
      for (var type in listModelQuestionType) {
        listQuestionType.add(type);
      }
      for (QuestionTypeModel qt in listQuestionType) {
        this.quesType = qt;
      }
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Học lý thuyết'),
        ),
        body: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                initializeDatabase();
                return Questions();
              }));
            },
            child: ListView(
              children:
                  this.listQuestionType.map((f) => questionType(f)).toList(),
            )));
  }
}

Widget questionType(QuestionTypeModel question) {
  return Card(
    elevation: 3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/icon/category_1.webp"),
          )),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  question.zTypeQuestion,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  question.zTypeQuestionDesc,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
