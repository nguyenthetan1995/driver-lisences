import 'package:flutter/material.dart';
class Hepl extends StatefulWidget {
  @override
  _HeplState createState() => _HeplState();
}

class _HeplState extends State<Hepl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hướng dẫn sử dụng'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 30.0),
              padding: EdgeInsets.all(10.0),
              child: new Text('Đây là ứng dụng giúp rút ngắn thời gian ôn thi bằng lái xe ô tô B2.', style: TextStyle(fontWeight: FontWeight.bold),)
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: new Text('1. Mỗi ngày dành ra 1 tiếng để học tất cả các loại biển báo giao thông thường gặp. Cố gắng tìm ra một điểm riêng biệt để nhận biết được loại biển báo đó...')
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: new Text('2. Khoảng thời gian còn lại hãy học những câu hỏi lý thuyết. Ghi nhớ những định nghĩa cơ bản, và tìm hiểu cách thức, mẹo để ghi nhớ những câu hỏi đó...')
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: new Text('3. Kết thúc tuần đầu tiên của quá trình học, hãy bắt tay vào thi các bộ đề thi theo bộ và đề thi ngẫu nhiên. Sau đó xem lại phần những câu hỏi hay sai để rút ra kinh nghiệm...')
          )
        ],
      ),

    );
  }
}
