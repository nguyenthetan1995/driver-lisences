import 'package:flutter/material.dart';
import 'package:test_license_driver/model/TestModel.dart';
import 'model/QuestionModel.dart';

class CheckAnswer extends StatefulWidget {
  CheckAnswer({this.Answer, this.index});
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
  }

  int _indexSelect;
  @override
  Widget build(BuildContext context) {
    var text = new RichText(
      text: new TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: new TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          new TextSpan(text: 'Câu ${widget.index + 1}: ' + widget.Answer.zQuestion??'',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ( widget.Answer.zQuestionDie != null && widget.Answer.IsFinish == true)
              ? new TextSpan(text: ' (Câu điểm liệt)', style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.blue,fontSize: 18))
              : new TextSpan(text: '')
        ],
      ),
    );
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: text /*Text(
              'Câu ${widget.index + 1}: ' + widget.Answer.zQuestion ?? '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),*/
          ),
          (widget.Answer.zImageQuestion == '')
              ? Container()
              : Container(
            height: 200,
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/imageapp/${widget.Answer.zImageQuestion}"),
                    fit: BoxFit.contain)),
          ),
          (widget.Answer?.zOption1 == null || widget.Answer?.zOption1 == '')
              ? Container()
              : InkWell (
                  splashColor: Color.fromRGBO(3, 98, 252, 0.2),
                  onTap: () {
                    ClickanSwers(1);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 5.0,top: 5),
                    child: Row(
                      children: <Widget>[
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                           /* CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 15,
                              child: CircleAvatar(
                               backgroundColor: Colors.white,
                                radius: 14,

                              ),
                            ),*/
                            Container(
                              width: 40.0,
                              height: 35,
                              margin: const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
                              decoration: new BoxDecoration(
                                  color: widget.Answer?.IsFinish == false
                                      ? ((_indexSelect != null && _indexSelect == 1 ) ? Colors.blue : Colors.white)
                                      : ((widget.Answer?.UserChoses ==1 ) ? Colors.blue : Colors.white),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.blueAccent)),
                            ),
                            Text('1' ,style: TextStyle(fontWeight: FontWeight.bold,color: (widget.Answer?.IsFinish == false)
                                ? ((_indexSelect != null && _indexSelect == 1) ? Colors.white : Colors.black87 )
                                :(widget.Answer?.UserChoses ==1 ) ? Colors.white : Colors.black87)
                            )
                          ],
                        ),
                        Expanded(
                          child: Text(widget.Answer?.zOption1,style: TextStyle(color: (widget.Answer?.IsFinish == false)
                            ? Colors.black87
                              :(widget.Answer?.zAnswer == '1' ) ? Colors.blue : (widget.Answer?.UserChoses == 1? Colors.red :  Colors.black87))
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          new Divider(
            indent: 0.0,
            color: Colors.grey,
            height: 0,
          ),
          (widget.Answer?.zOption2 == null || widget.Answer?.zOption2 == '')
              ? Container()
              : InkWell(
                  splashColor: Color.fromRGBO(3, 98, 252, 0.2),
                  onTap: () {
                    ClickanSwers(2);
                  },
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
                                  color: widget.Answer?.IsFinish == false
                                      ? ((_indexSelect != null && _indexSelect == 2 ) ? Colors.blue : Colors.white)
                                      : (( widget.Answer?.UserChoses == 2 ) ? Colors.blue : Colors.white),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.blueAccent)),
                            ),
                            Text('2' ,style: TextStyle(fontWeight: FontWeight.bold,color:widget.Answer?.IsFinish == false
                                ? ((_indexSelect != null && _indexSelect == 2) ? Colors.white : Colors.black87 )
                                :(widget.Answer?.UserChoses ==2 ) ? Colors.white : Colors.black87))
                          ],
                        ),
                        Expanded(
                          child: Text(widget.Answer?.zOption2,style: TextStyle(color: (widget.Answer?.IsFinish == false)
                              ? Colors.black87
                              :(widget.Answer?.zAnswer == '2' ) ? Colors.blue : (widget.Answer?.UserChoses == 2? Colors.red :  Colors.black87))
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          new Divider(
            indent: 0.0,
            color: Colors.grey,
            height: 0,
          ),
          (widget.Answer?.zOption3 == null || widget.Answer?.zOption3 == '')
              ? Container()
              : InkWell(
                  splashColor: Color.fromRGBO(3, 98, 252, 0.2),
                  onTap: () {
                    ClickanSwers(3);
                  },
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
                                  color:  widget.Answer?.IsFinish == false
                                      ? ((_indexSelect != null && _indexSelect == 3 ) ? Colors.blue : Colors.white)
                                      : ((  widget.Answer?.UserChoses == 3 ) ? Colors.blue : Colors.white),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.blueAccent)),
                            ),
                            Text('3' ,style: TextStyle(fontWeight: FontWeight.bold,color:widget.Answer?.IsFinish == false
                                ? ((_indexSelect != null && _indexSelect == 3) ? Colors.white : Colors.black87 )
                                :(widget.Answer?.UserChoses == 3 ) ? Colors.white : Colors.black87))
                          ],
                        ),
                        Expanded(
                          child: Text(widget.Answer?.zOption3,style: TextStyle(color: (widget.Answer?.IsFinish == false)
                              ? Colors.black87
                              :(widget.Answer?.zAnswer == '3' ) ? Colors.blue : (widget.Answer?.UserChoses == 3? Colors.red :  Colors.black87))
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          new Divider(
            indent: 0.0,
            color: Colors.grey,
            height: 0,
          ),
          (widget.Answer?.zOption4 == null || widget.Answer?.zOption4 == '')
              ? Container()
              : InkWell(
            splashColor: Color.fromRGBO(3, 98, 252, 0.2),
                  onTap: () {
                    ClickanSwers(4);
                  },
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
                                  color: widget.Answer?.IsFinish == false
                                      ? ((_indexSelect != null && _indexSelect == 4 ) ? Colors.blue : Colors.white)
                                      : ((widget.Answer?.UserChoses == 4 ) ? Colors.blue : Colors.white),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.blueAccent)),
                            ),
                            Text('4' ,style: TextStyle(fontWeight: FontWeight.bold,color:widget.Answer?.IsFinish == false
                                ? ((_indexSelect != null && _indexSelect == 4) ? Colors.white : Colors.black87 )
                                :(widget.Answer?.UserChoses ==4 ) ? Colors.white : Colors.black87))
                          ],
                        ),
                        Expanded(
                          child: Text(widget.Answer?.zOption4,style: TextStyle(color: (widget.Answer?.IsFinish == false)
                              ? Colors.black87
                              :(widget.Answer?.zAnswer == '4' ) ? Colors.blue : (widget.Answer?.UserChoses == 4? Colors.red :  Colors.black87))
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          (widget.Answer?.IsFinish == false)
              ? Container()
              : Card(
            child: Column(

              children: <Widget>[
                widget.Answer?.zAnswer == widget.Answer?.UserChoses.toString()?
                Container(
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  alignment:  Alignment.centerLeft,
                  child: Text('KẾT QUẢ: ĐÚNG ' , style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                )
                : Container(
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text('KẾT QUẢ: SAI ' , style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))
                ),
                widget.Answer?.zAnswerDesc != '' ? const ListTile(
                  title: Text('GIẢI THÍCH ĐÁP ÁN:', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                ): Text(''),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0, top: 0.0),
                  child: Text(widget.Answer?.zAnswerDesc , style: TextStyle(color:Colors.blue, fontSize: 16.0),),
                )

              ],
            ),
          ),
        ])
    );

  }

  ClickanSwers(int answersindex){
    widget.Answer.UserChoses = answersindex;
    /*if(answersindex != widget.Answer.zAnswer){
      widget.Answer.QuestionWrong = widget.Answer.QuestionWrong +1;
    }*/
    setState(() {
      _indexSelect = answersindex;
    });
  }
}
