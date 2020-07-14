import 'package:flutter/material.dart';
import 'learnquestion.dart';
import 'model/QuestionTypeModel.dart';
import 'processdatabase.dart';

class LearningPage extends StatefulWidget {
  @override
  _LearningPageState createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  List<QuestionTypeModel> listModelQuestionType;
  List listQuestionType = [];
  QuestionTypeModel quesType;

  @override
  void initState() {
    super.initState();
    initializeDatabase().then((v) async {
      this.listModelQuestionType = await getListQuestionType(v);
      for (var type in listModelQuestionType) {
        listQuestionType.add(type);
      }
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    if (question == null)
      return Container();

    return Scaffold(
        appBar: AppBar(
          title: Text('Học lý thuyết'),
        ),
        body:Container(
          color: Colors.black12.withOpacity(0.1),
          child: new ListView(
            children:
            this.listQuestionType.map((f) => questionType(f,context)).toList(),
          )
        ),
    );
  }
}

Widget questionType(QuestionTypeModel question, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Questions(question);
      }));
    },
    child: Container(
      /*elevation: 3,*/
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.9, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.white,
            Colors.white
          ],
        ),
      ),
      margin: const EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 60,
              width: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/icon/${question.zImage}.png"),
              )),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      question.zTypeQuestion,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      question.zTypeQuestionDesc,
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
