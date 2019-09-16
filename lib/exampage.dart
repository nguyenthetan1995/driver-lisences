import 'package:flutter/material.dart';
import 'package:test_license_driver/processdatabase.dart';

import 'model/QuestionModel.dart';


class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {

  List<QuestionModel> listModelQuestion;

  void onChange(bool b, String value) {
    selectedText = value;

    setState(() {
    });
  }

  QuestionModel question;
  @override
  void initState() {
    super.initState();

    initializeDatabase().then((v) async {
        this.listModelQuestion = await getListQuestion(v,49);

      for (QuestionModel q in listModelQuestion) {
        this.question = q;
    }
      setState(() {});
    });
  }

  var selectedText = "";
  List<Widget> lstTabs = [];
  List<Widget> lstQues = [];

  @override
  Widget build(BuildContext context) {

    if(question==null) return Container(color: Colors.orange,);
    print(question.zImageQuestion);
    var boobl = false;
    print( boobl);
//    print(selectedText);
    lstQues.clear();
    lstTabs.clear();
    for (var i = 0; i < 30; i++) {
      lstTabs.add(Tab(
        child: Text(
          'Câu ${i+1}',
          style: TextStyle(fontSize: 18),
        ),
      ));
      lstQues.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  question?.zQuestion ?? '',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),

            (question.zImageQuestion == '')? Container(color: Colors.white,) : Container(height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/imageapp/${question.zImageQuestion}"), fit: BoxFit.fitHeight)),
            ),

            Card(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, question?.zOption1);
                },
                selected: question?.zOption1 == selectedText,
                value: boobl,
                title: Text(question?.zOption1),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Card(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, question?.zOption2);
                },
                value: question?.zOption2 == selectedText,
                title: Text(question?.zOption2),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            (question?.zOption3 == null) ? Container() : Card(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, question?.zOption3);
                },
                value: question?.zOption3 == selectedText,
                title: Text(question?.zOption3),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            (question?.zOption4 == null) ? Container() : Card(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, this?.question?.zOption4);
                },
                value: question?.zOption4 == selectedText,
                title: Text(question?.zOption4),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
          ],
        ),
      ));
    }

    print('lstTabs:'+lstTabs.length.toString());
    print('lstQues:'+lstQues.length.toString());
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
