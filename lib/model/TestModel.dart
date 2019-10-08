import 'package:test_license_driver/model/QuestionModel.dart';

class TestModel
{
  TestModel({this.status,this.Questions,this.id,this.number});
  int number;
  int id;
  String status;
  List<QuestionModel> Questions;
  factory TestModel.fromJson(Map<String, dynamic> json){
    return TestModel(
      status: json["status"],
      Questions: (json["Questions"] as List). map((g)=>QuestionModel.fromJson(g)).toList(),
      id: json["id"],
      number: json["number"],

    );
  }
  Map<String,dynamic> toJson(){
    var result=  Map<String,dynamic>() ;
    result["status"]=this.status;
    result["Questions"]=this.Questions.map((f)=>f.toJson()).toList();
    result["id"]=this.id;
    result["number"]=this.number;
    return result;

  }
}
