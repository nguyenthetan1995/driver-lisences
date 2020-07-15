import 'dart:convert';

QicklearnModel questionFromJson(String str) {
  final jsonDataQuestion = json.decode(str);
  return QicklearnModel.fromJson(jsonDataQuestion);
}

class QicklearnModel{
  String ZCONTENT;
  int ZINDEX;
  String ZDESC;
  bool isExpanded ;
  QicklearnModel({
    this.ZCONTENT,
    this.ZINDEX,
    this.ZDESC,
    this.isExpanded
  }
      );
  Map<String,dynamic> toJson(){
    var result=  Map<String,dynamic>() ;
    result["ZCONTENT"] =  this.ZCONTENT;
    result["ZINDEX"]= this.ZINDEX;
    result["ZDESC"]=this.ZDESC;
    result["isExpanded"]=this.isExpanded;
    return result;

  }
  factory QicklearnModel.fromJson(Map<String, dynamic> json){
    return QicklearnModel(
      ZCONTENT :json["ZCONTENT"],
      ZINDEX: json["ZINDEX"],
      ZDESC: json["ZDESC"],
      isExpanded:json["isExpanded"]
    );
  }

}