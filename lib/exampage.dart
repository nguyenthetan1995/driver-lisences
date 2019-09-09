import 'package:flutter/material.dart';
import 'package:hoclaixe/models/QuestionModel.dart';
import 'db.dart';

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {

  void onChange(bool b, String value) {
    selectedText = value;
   /* print(b.toString()+":"+selectedText);
    print(this?.q?.zOption1);
    print(this?.q?.zOption2);
    print(this?.q?.zOption3);*/
    setState(() {

    });
  }

  QuestionModel q;
  @override
  void initState() {
    super.initState();


    initializeDatabase().then((v) async {
      var q = await getQuestion(v);
      this.q = q;
      setState(() {});
    });
  }

  var selectedText = "";
  List<Widget> lstTabs = [];
  List<Widget> lstQues = [];

  @override
  Widget build(BuildContext context) {

    if(q==null) return Container(color: Colors.orange,);

    var boobl = false;
    print( boobl);
    print(selectedText);
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
                  this?.q?.zQuestion ?? '',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),

            (this.q.zImage == null)?Container(height: 50,color: Colors.orange,): Container(
              height: 200,
//              color: Colors.green,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/imageapp/${this.q.zIndex}.webp"), fit: BoxFit.fill)),
            ),

            Card(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, this?.q?.zOption1);
                },
                selected: this?.q?.zOption1 == selectedText,
                value: boobl,
                title: Text(this?.q?.zOption1),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Card(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, this?.q?.zOption2);
                },
                value: this?.q?.zOption2 == selectedText,
                title: Text(this?.q?.zOption2),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            (this?.q?.zOption3 == null) ? Container() : Card(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, this?.q?.zOption3);
                },
                value: this?.q?.zOption3 == selectedText,
                title: Text(this?.q?.zOption3),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            (this?.q?.zOption4 == null) ? Container() : Card(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, this?.q?.zOption4);
                },
                value: this?.q?.zOption4 == selectedText,
                title: Text(this?.q?.zOption4),
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
