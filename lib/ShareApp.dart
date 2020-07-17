import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:screenshot/screenshot.dart';
class ShareApp extends StatefulWidget {
  @override
  _ShareAppState createState() => _ShareAppState();
}

class _ShareAppState extends State<ShareApp> {
  final _controller = ScreenshotController();

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Chọn ứng dụng chia sẻ',
        text:'',
        chooserTitle: 'Chọn ứng dụng chia sẻ'
    );
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      share();
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Chia sẻ ứng dụng'),
      ),
      body: Center(
        child: Screenshot(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
