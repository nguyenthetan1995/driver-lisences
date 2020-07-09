import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_license_driver/model/TestModel.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'model/QuestionModel.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'dart:math' as math;
import 'CheckAnswers.dart';

class ExamPage extends StatefulWidget {
  ExamPage({this.testModel});
  TestModel testModel;
  StreamController _stream;

  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage>
    with SingleTickerProviderStateMixin {
  List<QuestionModel> listModelQuestion = [];
  List<QuestionModel> listModelQuestion431 = [];
  List<QuestionModel> listModelQuestion432 = [];
  List<QuestionModel> listModelQuestion433 = [];
  List<QuestionModel> listModelQuestion44 = [];
  List<QuestionModel> listModelQuestion45 = [];
  List<QuestionModel> listModelQuestion4647 = [];
  List<QuestionModel> listModelQuestion48 = [];
  List<QuestionModel> listModelQuestion49 = [];
  List<QuestionModel> listQuestionExam = [];
  QuestionModel question;
  List<Widget> lstTabs = [];
  List<Widget> lstQues = [];
  TabController _controller;
  StreamController<List<String>> _streamController=StreamController<List<String>>.broadcast();

  @override
  void initState() {
    super.initState();
    _streamController.stream.listen((event) {
      print(event[0]);

    });
    listQuestionExam = widget.testModel.Questions;
    _controller = TabController(vsync: this, length: listQuestionExam.length);
    for (var i = 0; i < listQuestionExam.length; i++) {
      lstTabs.add(
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Câu ${i + 1}/35',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      );
      lstQues = (buildListView(listQuestionExam, _controller,_streamController.stream));
    }

    _controller.addListener(_handleTabSelection);
//    initializeDatabase().then((v) async {
//      this.listModelQuestion = await getAllListQuestion(v);
////      setState(() {});
//    });
  }

  int _tabIndex = 0;
  void _nextPage(int delta) {
    final int newIndex = _controller.index + delta;
    if (newIndex < 0 || newIndex >= _controller.length) return;
    _controller.animateTo(newIndex);
  }

  int _currentIndex = 0;
  void _handleTabSelection() {
    setState(() {
      _currentIndex = _controller.index;
    });
    print("_controller index change");
    print(_controller.index);
    // to save index-1
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: lstTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Đề số 1',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: lstQues,
        ),
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.blue,
          child: Row(
            children: <Widget>[
              Container(
                  child: Center(
                child: IconButton(
                  tooltip: 'Quay lại',
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 45.0,
                  ),
                  onPressed: () {
                    _nextPage(-1);
                  },
                ),
              )),
              Expanded(
                child: Center(
                  child: CountdownFormatted(
                    duration: Duration(minutes: 22),
                    builder: (BuildContext ctx, String remaining) {
                      return Text(
                        remaining,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ); // 01:00:00
                    },
                  ),
                ),
              ),
              Container(
                  child: _controller.index != (lstTabs.length - 1)
                      ? IconButton(
                          icon: const Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 45.0,
                          ),
                          tooltip: 'Câu kế tiếp',
                          onPressed: () {
                            _nextPage(1);

                          },
                        )
                      : IconButton(
                          padding: const EdgeInsets.only(right: 20.0),
                          icon: const Icon(
                            Icons.assignment,
                            color: Colors.white,
                            size: 45.0,
                          ),
                          tooltip: 'Kết quả',
                          onPressed: () {
                            /*widget._stream.add(newdata)*/
                            for(var i = 0; i <=listQuestionExam.length-1 ; i++){
                              /*if(listQuestionExam[i].UserChoses!=null && listQuestionExam[i].UserChoses.length > 0 ){
                                for(var index =0 ; index <= listQuestionExam[i].UserChoses.length; index ++){
                                  if(listQuestionExam[i].UserChoses[index] == '1'){
                                    listQuestionExam[i].Option1 = true;
                                  }
                                  if(listQuestionExam[i].UserChoses[index] == '2'){
                                    listQuestionExam[i].Option2 = true;
                                  }
                                  if(listQuestionExam[i].UserChoses[index] == '3'){
                                    listQuestionExam[i].Option3 = true;
                                  }
                                  if(listQuestionExam[i].UserChoses[index] == '4'){
                                    listQuestionExam[i].Option4 = true;
                                  }
                                }
                              }*/
                              listQuestionExam[i].IsFinish = true;
                            }
                            _streamController.add(<String>[
                              "34",
                              "babcbcb"
                            ]);

                           /* widget._stream.stream.listen((event) {
                              setState(() {

                              });
                            });*/
                            _settingModalBottomSheet([context,lstQues]);
                          },
                        ))
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> buildListView(List<QuestionModel> list, TabController controller,Stream event) {
  return list.map((e) => CheckQuestion(list.indexOf(e), e,event)).toList();
}

class CheckQuestion extends StatefulWidget {
  CheckQuestion(this.index, this.question,this.stream);
  final QuestionModel question;
  final int index;
  final Stream<List<String>> stream;
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
  StreamSubscription _subscription;
 @override
  void initState() {
    super.initState();
    bool isfinish = false;
    _subscription= widget.stream.listen((event) {

      setState(() {
      });
    });

  }
  @override
  void dispose() {
    print("dispose:");
    if(_subscription!=null) _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CheckAnswer(Answer:widget.question,index:widget.index)
      /*Container(
        child:ListView(
          children: <Widget>[
            Container(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Câu ${widget.index + 1}: ' + widget.question?.zQuestion ?? '',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            (widget.question.zImageQuestion == '')
                ? Container()
                : Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/imageapp/${widget.question.zImageQuestion}"),
                      fit: BoxFit.contain)),
            ),
            Container(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, widget.question?.zOption1);
                  (b) ? answers.add('1') : answers.remove('1');
                  widget.question?.UserChoses = answers;
                  print(widget.question?.UserChoses);
                },
                value: selectedText.contains(widget.question?.zOption1),
                selected: selectedText.contains(widget.question?.zOption1),
                title: Text(widget.question?.zOption1),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            (widget.question?.zOption3 == null)
                ? Container()
                : Container(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, widget.question?.zOption2);
                  (b) ? answers.add('2') : answers.remove('2');
                  widget.question?.UserChoses = answers;
                  print(widget.question?.UserChoses);
                },
                value:  selectedText.contains(widget.question?.zOption2),
                selected: selectedText.contains(widget.question?.zOption2),
                title: Text(widget.question?.zOption2),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            (widget.question?.zOption3 == null)
                ? Container()
                : Container(
                child: CheckboxListTile(
                  onChanged: (b) {
                    onChange(b, widget.question?.zOption3);
                    (b) ? answers.add('3') : answers.remove('3');
                    widget.question?.UserChoses = answers;
                    print(widget.question?.UserChoses);
                  },
                  value:  selectedText.contains(widget.question?.zOption3),
                  selected: selectedText.contains(widget.question?.zOption3),
                  title: Text(widget.question?.zOption3),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.red
              ),
            ),
            (widget.question?.zOption4 == null || widget.question?.zOption4 == '')
                ? Container()
                : Container(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, widget.question?.zOption4);
                  (b) ? answers.add('4') : answers.remove('4');
                  widget.question?.UserChoses = answers;
                },
                value: selectedText.contains(widget.question?.zOption4),
                selected: selectedText.contains(widget.question?.zOption4),
                title: Text(widget.question?.zOption4),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            (widget.question?.IsFinish == false)
                ? Container()
                : Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    widget.question?.zAnswer == '1'?
                    const ListTile(
                      title:  Text('Kết quả: ' , style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                      subtitle: Text('Đáp án đúng là: A',style: TextStyle(fontSize: 20.0,)),
                    ):
                    widget.question?.zAnswer == '2'?
                    const ListTile(
                      title:  Text('Kết quả: ' , style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                      subtitle: Text('Đáp án đúng là: B',style: TextStyle(fontSize: 20.0,)),
                    ):
                    widget.question?.zAnswer == '3'?
                    const ListTile(
                      title:  Text('Kết quả: ' , style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                      subtitle: Text('Đáp án đúng là: C',style: TextStyle(fontSize: 20.0,)),
                    )
                    :
                    const ListTile(
                      title:  Text('Kết quả: ' , style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                      subtitle: Text('Đáp án đúng là: D',style: TextStyle(fontSize: 20.0,)),
                    ),
                    widget.question?.zAnswerDesc != '' ? const ListTile(
                      title: Text('Giải thích:', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ): Text(''),
                   Container(
                     padding: const EdgeInsets.only(left: 15.0, right: 10.0, bottom: 10.0, top: 0.0),
                     child: Text(widget.question?.zAnswerDesc , style: TextStyle(color:Colors.blue, fontSize: 20.0),),
                   )

                  ],
                ),
            ),
          ],
        ),
      )*/
    );
  }

}



void _settingModalBottomSheet(data){
  List<Widget> result = [];
  var number = 0;
  var ispass = false;
  var isDieQuestion = 0;
  for(var i = 0; i < data[1].length ; i++){
    QuestionModel ques = data[1][i].question;
    var isCorect = false;
    if(ques.UserChoses!=null && ques.UserChoses?.length > 0 ){
      if(ques.UserChoses[0] == ques.zAnswer){
        isCorect = true;
        number ++;
      }
      else{
        isCorect = false;
      }

    }
    else{
      if(data[1][i].question.zQuestionDie != "" ){
        isDieQuestion ++;
      }
      isCorect = false;
    }
    result.add(
        Container(
            width: 40.0,
            height: 30.0,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)
              ),
              border: Border.all(
                  width: 2.0,
                  color: Colors.black12
              ),
            ),
            child: new Column(
                 children: <Widget>[
                   Text('Câu ' + (i+ 1).toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                   Expanded(
                     child: Center(
                       child:isCorect == true ? Icon(Icons.check_circle, color: Colors.blue,size: 30.0,) : Icon(Icons.cancel,color: Colors.red,size: 30.0)
                     ),
                   ),
                 ],
            )
        ),
    );
  }
  if(number  > 31){

    ispass = true;
  }
  showModalBottomSheet(

      context: data[0],
      builder: (BuildContext bc){
        return Container(
          color: Colors.blue,
          padding: EdgeInsets.all(10.0),
          child:Column(
            children: <Widget>[
              Container(
                height: 80.0,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: ispass == true ?
                      Text('Chúc mừng bạn đã thi đậu!',style: TextStyle(color: Colors.white, fontSize: 30.0),)
                          : Text('Bạn chưa đậu!',style: TextStyle(color: Colors.white, fontSize: 30.0)),
                    ) ,
                    Text(number.toString()+'/35',style: TextStyle(color: Colors.white, fontSize: 30.0)
                    ),
                  ],
                )
              ),
              Expanded(
                  child: GridView.count(
                      crossAxisCount: 5,
                      childAspectRatio: 1.1,
                      padding: const EdgeInsets.only(top:2.0, left: 2.0, right: 2.0),
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 15.0,
                      children: result
                  ),
              )
            ],
          )
        );
      }
  );
}