import 'dart:math';
import 'package:flutter/material.dart';
import 'package:test_license_driver/processdatabase.dart';
import 'model/QuestionModel.dart';

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
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
  QuestionModel question;

  @override
  void initState() {
    super.initState();
    initializeDatabase().then((v) async {
      this.listModelQuestion = await getAllListQuestion(v);
      setState(() {});
    });
  }

  List<Widget> lstTabs = [];
  List<Widget> lstQues = [];

  @override
  Widget build(BuildContext context) {
    listQuestionExam.clear();
    listModelQuestion431.clear();
    listModelQuestion432.clear();
    listModelQuestion44.clear();
    listModelQuestion45.clear();
    listModelQuestion4647.clear();
    listModelQuestion48.clear();
    listModelQuestion49.clear();
    if (listModelQuestion.length == 0)
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      );
    if (listModelQuestion.length != 0) {
      for (int i = 0; i < 21; i++) {
        this.listModelQuestion431.add(listModelQuestion[i]);
      }
      QuestionModel question431 =
          listModelQuestion431[Random().nextInt(listModelQuestion431.length)];
      listQuestionExam.add(question431);

      for (int i = 21; i < 131; i++) {
        this.listModelQuestion432.add(listModelQuestion[i]);
      }
      for (int i = 1; i <= 7; i++) {
        QuestionModel question432 =
            listModelQuestion432[Random().nextInt(listModelQuestion432.length)];
        listQuestionExam.add(question432);
      }

      for (int i = 131; i < 145; i++) {
        this.listModelQuestion433.add(listModelQuestion[i]);
      }
      QuestionModel question433 =
          listModelQuestion433[Random().nextInt(listModelQuestion433.length)];
      listQuestionExam.add(question433);

      for (int i = 145; i < 175; i++) {
        this.listModelQuestion44.add(listModelQuestion[i]);
      }
      QuestionModel question44 =
          listModelQuestion44[Random().nextInt(listModelQuestion44.length)];
      listQuestionExam.add(question44);

      for (int i = 175; i < 200; i++) {
        this.listModelQuestion45.add(listModelQuestion[i]);
      }
      QuestionModel question45 =
          listModelQuestion45[Random().nextInt(listModelQuestion45.length)];
      listQuestionExam.add(question45);

      for (int i = 200; i < 255; i++) {
        this.listModelQuestion4647.add(listModelQuestion[i]);
      }
      QuestionModel question4647 =
          listModelQuestion4647[Random().nextInt(listModelQuestion4647.length)];
      listQuestionExam.add(question4647);

      for (int i = 255; i < 355; i++) {
        this.listModelQuestion48.add(listModelQuestion[i]);
      }
      for (int i = 1; i <= 9; i++) {
        QuestionModel question48 =
            listModelQuestion48[Random().nextInt(listModelQuestion48.length)];
        listQuestionExam.add(question48);
      }

      for (int i = 355; i < 450; i++) {
        this.listModelQuestion49.add(listModelQuestion[i]);
      }
      for (int i = 1; i <= 9; i++) {
        QuestionModel question49 =
            listModelQuestion49[Random().nextInt(listModelQuestion49.length)];
        listQuestionExam.add(question49);
      }
      lstQues.clear();
      lstTabs.clear();
      for (var i = 0; i < 30; i++) {
        lstTabs.add(Tab(
          child: Text(
            'Câu ${i + 1}',
            style: TextStyle(fontSize: 18),
          ),
        ));
        lstQues = (buildListView(listQuestionExam));
        for (QuestionModel question in listQuestionExam) {
          this.question = question;
        }
      }
    }

/*    print('listQuestionExam.length: ' + listQuestionExam.length.toString());
    var value=jsonEncode(listQuestionExam.map((f)=>f.toJson()).toList());
    var list=jsonDecode(value) as List;
    print("encode:"+value);
    var result=list.map((f)=>QuestionModel.fromJson(f)).toList();
    print("decode:"+result[0].toJson().toString());*/
    return DefaultTabController(
      length: lstTabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Đề số 1',
              style: TextStyle(fontSize: 20.0),
            ),
            bottom: PreferredSize(
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  indicatorColor: Colors.white,
                  tabs: lstTabs,
                ),
                preferredSize: Size.fromHeight(40.0)),
          ),
          body: TabBarView(children: lstQues)),
    );
  }
}

List<Widget> buildListView(List<QuestionModel> list) {
  return list.map((f) => CheckQuestion(f)).toList();
}

class CheckQuestion extends StatefulWidget {
  CheckQuestion(this.question);
  final QuestionModel question;
  @override
  _CheckQuestionState createState() => _CheckQuestionState();
}

class _CheckQuestionState extends State<CheckQuestion> {

  List<String> answers = [];

  var selectedText = List<String>();
  var b = false;
  void onChange(bool b, String value) {
    setState(() {
      if (b) {
        selectedText.add(value);
      } else {
        selectedText.remove(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Card(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Text(
                widget.question?.zQuestion ?? '',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          (widget.question.zImageQuestion == null)
              ? Container()
              : Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/imageapp/${widget.question.zImageQuestion}"),
                          fit: BoxFit.contain)),
                ),
          Card(
            child: CheckboxListTile(
              onChanged: (b) {
                onChange(b, widget.question?.zOption1);
                (b)?answers.add('1'):answers.remove('1');
                print(answers);
              },
              value: selectedText.contains(widget.question?.zOption1),
              selected: selectedText.contains(widget.question?.zOption1),
              title: Text(widget.question?.zOption1),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
          Card(
            child: CheckboxListTile(
              onChanged: (b) {
                onChange(b, widget.question?.zOption2);
                (b)?answers.add('2'):answers.remove('2');
                print(answers);
              },
              value: selectedText.contains(widget.question?.zOption2),
              selected: selectedText.contains(widget.question?.zOption2),
              title: Text(widget.question?.zOption2),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
          (widget.question?.zOption3 == null)
              ? Container()
              : Card(
                  child: CheckboxListTile(
                    onChanged: (b) {
                      onChange(b, widget.question?.zOption3);
                      (b)?answers.add('3'):answers.remove('3');
                      print(answers);
                    },
                    value: selectedText.contains(widget.question?.zOption3),
                    selected: selectedText.contains(widget.question?.zOption3),
                    title: Text(widget.question?.zOption3),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
          (widget.question?.zOption4 == null)
              ? Container()
              : Card(
                  child: CheckboxListTile(
                    onChanged: (b) {
                      onChange(b, widget.question?.zOption4);
                      (b)?answers.add('4'):answers.remove('4');
                      print(answers);
                    },
                    value: selectedText.contains(widget.question?.zOption4),
                    selected: selectedText.contains(widget.question?.zOption4),
                    title: Text(widget.question?.zOption4),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
        ],
      ),
    );
  }
}
