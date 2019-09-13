import 'package:flutter/material.dart';
import 'package:test_license_driver/model/QuestionModel.dart';
import 'package:test_license_driver/processdatabase.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  List<QuestionModel> listModelQuestion;

  QuestionModel ques;

  @override

  void initState() {
    super.initState();
    initializeDatabase().then((v) async {
      for (int typeQuestion = 43; typeQuestion <= 49; typeQuestion++) {
        this.listModelQuestion = await getListQuestion(v,typeQuestion);

      }
      for (QuestionModel q in listModelQuestion) {
        this.ques = q;
      }
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              question.zTypeQuestion,
              style: TextStyle(fontSize: 20.0),
            ),
            bottom: PreferredSize(
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  indicatorColor: Colors.white,
                  tabs: <Widget>[Text('khái niệm và quy tắc'),]

                ),
                preferredSize: Size.fromHeight(40.0)),
          ),
          body: TabBarView(children: <Widget>[question(ques)],))
      );
  }
}

Widget question(QuestionModel ques){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: <Widget>[
        Card(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Text(
              ques.zQuestion ?? '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),

        (ques.zImageQuestion == '')? Container() : Container(height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imageapp/${ques.zImageQuestion}"), fit: BoxFit.fill)),
        ),

        Card(
          child: Container(
            child: Text(ques.zOption1),
            ),
          ),
        Card(
          child: Container(
            child: Text(ques.zOption2),
            ),
          ),
        (ques.zOption3 == null) ? Container(): Card(
          child: Container(
            child: Text(ques.zOption3),
          ),
        ),
        (ques.zOption4 == null) ? Container(): Card(
          child: Container(
            child: Text(ques.zOption4),
          ),
        ),
        (ques.zAnswerDesc == null) ? Container(): Card(
          child: Container(
            child: Text(ques.zAnswerDesc),
          ),
        ),


      ],
    ),
  );
}
