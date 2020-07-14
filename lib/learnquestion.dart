import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_license_driver/model/QuestionModel.dart';
import 'package:test_license_driver/processdatabase.dart';
import 'model/QuestionTypeModel.dart';

class Questions extends StatefulWidget {
  Questions(this.questionType);
  final QuestionTypeModel questionType;

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  QuestionModel question;
  List<QuestionModel> listQuestion = [];
  List listQuestionType = [];
  List<Widget> bodyTabs = new List();
  List<Widget> lstTabs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDatabase().then((v) async {
      this.listQuestion = await getListQuestion(v, widget.questionType.zIndex);
      for (QuestionModel question in listQuestion) {
        this.question = question;
      }
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    lstTabs.clear();
    if (listQuestion.length == 0) return Container();
    if (listQuestion.length != 0) {
      bodyTabs = (buildListView(listQuestion));
      for (int i = 0; i < listQuestion.length; i++) {
        lstTabs.add(Tab(
          child: Text(
            'Câu ${i + 1}',
            style: TextStyle(fontSize: 16),
          ),
        ));
      }
    }
    return DefaultTabController(
        length: lstTabs.length,
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
            body: TabBarView(children: bodyTabs)));
  }
}

List<Widget> buildListView(List<QuestionModel> list) {
  return list.map((f) => question(f)).toList();
}

Widget question(QuestionModel question) {
  List<String> answers = (question.zAnswer.split(','));
  return Container (
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              question.zQuestion,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          (question.zImageQuestion == '')
              ? Container()
              : Container(
            height: 200,
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/imageapp/${question.zImageQuestion}"),
                    fit: BoxFit.contain)),
          ),
          new Divider(
            indent: 0.0,
            color: Colors.grey,
            height: 0,
          ),
          (answers.contains('1'))
              ? answerRight(question.zOption1,1)
              : answerWrong(question.zOption1,1),
          new Divider(
            indent: 0.0,
            color: Colors.grey,
            height: 0,
          ),
          (answers.contains('2'))
              ? answerRight(question.zOption2,2)
              : answerWrong(question.zOption2,2),
          new Divider(
            indent: 0.0,
            color: Colors.grey,
            height: 0,
          ),
          (question.zOption3 == null || question.zOption3 == '')
              ? Container()
              : (answers.contains('3'))
              ? answerRight(question.zOption3,3)
              : answerWrong(question.zOption3,3),
          new Divider(
            indent: 0.0,
            color: Colors.grey,
            height: 0,
          ),
          (question.zOption4 == null || question.zOption4 == '')
              ? Container()
              : (answers.contains('4'))
              ? answerRight(question.zOption4,4)
              : answerWrong(question.zOption4,4),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: (question.zAnswerDesc == '')
                ? Container()
                : Column(
              children: <Widget>[
                Text(
                  'Giải thích đáp án',
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    question.zAnswerDesc,
                    style: TextStyle(fontSize: 15),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
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
