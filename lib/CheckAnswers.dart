import 'package:flutter/material.dart';
import 'package:test_license_driver/model/TestModel.dart';
import 'model/QuestionModel.dart';

class CheckAnswer extends StatefulWidget {
  CheckAnswer({this.Answer,this.index});
  QuestionModel Answer;
  int index;
  @override
  _CheckAnswerState createState() => _CheckAnswerState();
}

class _CheckAnswerState extends State<CheckAnswer> {
  QuestionModel listQuestionExam;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listQuestionExam = widget.Answer;
    buildContainer(listQuestionExam);
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
 buildContainer(QuestionModel listQuestionExam){
  return Container(
    child: Column(
      children: <Widget>[
        Row(

        ),
      ],
    ),
  );
}