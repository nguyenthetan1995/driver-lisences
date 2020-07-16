import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class LearnQickContent{
  String Content;
  bool isExpan;

  LearnQickContent({
    this.Content,
    this.isExpan
  });
  factory LearnQickContent.fromJSON(Map<String,dynamic> json){
    return LearnQickContent(
        Content : json["Content"],
        isExpan: json["isExpan"]
    );
  }
}


