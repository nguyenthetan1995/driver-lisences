import 'package:flutter/material.dart';
import 'exampage.dart';

class ListExamPage extends StatefulWidget {
  @override
  _ListExamPageState createState() => _ListExamPageState();
}

class _ListExamPageState extends State<ListExamPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Colors.grey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thi sát hạch'),
        ),
        body: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
//                                initializeDatabase();
              return ExamPage();
            }));
            print('123');
          },
          child: Container(
            child: exam(context),
          ),
        ),
      ),
    );
  }
}

Widget exam(context) {
  return Card(
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Làm bài',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Đề số 1',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '0/30 câu',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
  );
}
