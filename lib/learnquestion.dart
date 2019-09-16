import 'package:flutter/material.dart';
import 'package:test_license_driver/model/QuestionModel.dart';
import 'package:test_license_driver/processdatabase.dart';

import 'model/QuestionTypeModel.dart';

class Questions extends StatefulWidget {
  Questions(this.questionType);
  QuestionTypeModel questionType;

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  QuestionModel question;
  List<QuestionModel> listQuestion;
  List<QuestionTypeModel> listModelQuestionType;
  List listQuestionType = [];
  List<Widget> bodyTabs = new List();
  List<Widget> lstTabs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDatabase().then((v) async {
      this.listQuestion = await getListQuestion(v, widget.questionType.zIndex);
      print("listQuestion.length");
      print(listQuestion.length);
      bodyTabs=(buildListView(listQuestion));
      print(bodyTabs.length);
      for (QuestionModel question in listQuestion) {
        this.question = question;
      }
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    lstTabs.clear();
    for (int i = 0; i < listQuestion.length; i++) {
      lstTabs.add(Tab(
        child: Text('Câu ${i + 1}', style: TextStyle(fontSize: 16),),
      ));
    }
    return DefaultTabController(
        length: listQuestion.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.questionType.zTypeQuestion,
              style: TextStyle(fontSize: 20.0),
            ),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.5),
                    indicatorColor: Colors.white,
                    tabs: lstTabs),
                preferredSize: Size.fromHeight(40.0)),
          ),
          body: TabBarView(children: bodyTabs)
        ));
  }
}

List<Widget> buildListView(List<QuestionModel> list) {
  return list.map((f) => question(f)).toList();
}

Widget question(QuestionModel question) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: <Widget>[
        Card(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Text(
              question.zQuestion,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        (question.zImageQuestion == '')
            ? Container()
            : Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/imageapp/${question.zImageQuestion}"),
                        fit: BoxFit.fill)),
              ),
        Card(
          child: Container(
            child: Text(question.zOption1),
          ),
        ),
        Card(
          child: Container(
            child: Text(question.zOption2),
          ),
        ),
        (question.zOption3 == null)
            ? Container()
            : Card(
                child: Container(
                  child: Text(question.zOption3),
                ),
              ),
        (question.zOption4 == null)
            ? Container()
            : Card(
                child: Container(
                  child: Text(question.zOption4),
                ),
              ),
        (question.zAnswerDesc == null)
            ? Container()
            : Card(
                child: Container(
                  child: Text(question.zAnswerDesc),
                ),
              ),
      ],
    ),
  );
}
