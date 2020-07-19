import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_license_driver/model/TestModel.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'model/QuestionModel.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_license_driver/processdatabase.dart';
import 'dart:math' as math;
import 'CheckAnswers.dart';
import 'Alert.dart';
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
    for (var i = 0; i < listQuestionExam.length; i++){
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
  void _handleTabSelection(){
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Đề số ${widget.testModel.number}',
                  style: TextStyle(fontSize: 20.0),
                ),
                (listQuestionExam.length !=0)
                ? (listQuestionExam[_currentIndex].IsFinish != true )?
                GestureDetector(
                  child: Text('Kết thúc') ,
                  onTap: () async{
                    await showAlert([context,listQuestionExam,lstQues,_streamController]);
                    setState(() {});
                    _streamController.add(<String>[
                      "34",
                      "babcbcb"
                    ]);

                  },
                )
                :Container()
              :Container()
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
                )
              ),
              Expanded(
                child: Center(
                  child:(listQuestionExam.length !=0) ?
                  listQuestionExam[_controller.index].IsFinish != true
                  ? Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(image: AssetImage('assets/icon/clock.png'), height: 40,width: 40,)
                        ,
                        CountdownFormatted(
                          duration: Duration(minutes: 22),
                          builder: (BuildContext ctx, String remaining) {
                            return Text(
                              remaining,
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ); // 01:00:00
                          },
                        )],
                    )
                  )
                  :IconButton(
                    padding: const EdgeInsets.only(right: 20.0),
                    icon: const Icon(
                      Icons.assignment,
                      color: Colors.white,
                      size: 45.0,
                    ),
                    tooltip: 'Kết quả',
                    onPressed: () {
                      for(var i = 0; i <=listQuestionExam.length-1 ; i++){
                        listQuestionExam[i].IsFinish = true;
                      }
                      _streamController.add(<String>[
                        "34",
                        "babcbcb"
                      ]);
                      _settingModalBottomSheet([context,lstQues]);
                    },
                  )
                  :Container()
                ),
              ),
              listQuestionExam.length!=0?
              (listQuestionExam[_controller.index].IsFinish == false)
                ? Container(
                    child: (_controller.index != (lstTabs.length - 1))
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
                        )
                )
                :  Container(
                  child: (_controller.index != (lstTabs.length - 1))
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
                    : Container()

              )
              : Container()
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
      child: new CheckAnswer(Answer:widget.question,index:widget.index)
    );
  }
}
showAlert(data) {
  showDialog(
    context: data[0],
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('KẾT THÚC.'),
        content: Text("Bạn có chắc chắn kết thúc bài thi?"),
        actions: <Widget>[
          FlatButton(
            child: Text("Đồng ý"),
            onPressed: ()async {
              for(var i = 0; i <=data[1].length-1 ; i++){
                data[1][i].IsFinish = true;
              }
              data[3].add(<String>[
                "34",
                "babcbcb"
              ]);
              _settingModalBottomSheet([data[0],data[2]]);
              Navigator.of(data[0]).pop();


            },
          ),
          FlatButton(
            child: Text("Hủy"),
            onPressed: () {
              //Put your code here which you want to execute on No button click.
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
void _settingModalBottomSheet(data) async{

  List<Widget> result = [];
  var IsdieQuestion = false;
  var number = 0;
  var ispass = false;
  String Result = '';
  var isDieQuestion = 0;
  for(var i = 0; i < data[1].length ; i++){
    QuestionModel ques = data[1][i].question;
    var isCorect = false;
    if(ques.UserChoses!=null ){
      if(ques.UserChoses.toString() == ques.zAnswer){
        isCorect = true;
        number ++;
      }
      else{
        isCorect = false;
        if(ques.zQuestionDie != null  || ques.zQuestionDie != '' ){
          IsdieQuestion = true;
          isDieQuestion ++;
        }
        await initializeDatabase().then((v) async {
           await WriteQuestionWrong(v, ques.Z_PK);
        });
      }
    }
    else{
      if(ques.zQuestionDie != "" ){
        isDieQuestion ++;
      }
      await initializeDatabase().then((v) async {
        await WriteQuestionWrong(v, ques.Z_PK);
      });
      isCorect = false;
    }
    result.add(
        Container(
            width: 50.0,
            height: 50.0,
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
                   Flexible(
                     flex: 1,
                     child:
                     Text((i+ 1).toString(), style: TextStyle(fontWeight: FontWeight.bold),)
                   ),
                   Flexible(flex: 1,
                     child: Center(
                       child:Container(
                         margin: EdgeInsets.only(top: 5.0),
                         child: isCorect == true ?
                         Icon(Icons.check_circle, color: Colors.blue,size: 20.0,) :
                         Icon(Icons.cancel,color: Colors.red,size: 20.0),
                       )
                     ),
                   ),
                 ],
            )
        ),
    );
  }
  if(number  > 31){
    if(IsdieQuestion == false){
      Result = 'BẠN ĐÃ ĐẬU!';
      ispass = true;
    }
    else{
      ispass = false;
      Result = 'BẠN ĐÃ TRƯỢT! (Sai câu liệt)';
    }
  }
  else{
    Result = 'BẠN ĐÃ TRƯỢT!';
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
                padding: EdgeInsets.only(top: 0),
                margin: EdgeInsets.only(bottom: 10),
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Text(Result,style: TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold),)
                      ),
                      Text(number.toString()+'/35',style: TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold)
                      ),
                    ],
                  )
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