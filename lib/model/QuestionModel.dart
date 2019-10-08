import 'dart:convert';

QuestionModel questionFromJson(String str) {
  final jsonDataQuestion = json.decode(str);
  return QuestionModel.fromJson(jsonDataQuestion);
}

class QuestionModel{
  String zQuestion;
  String zOption1;
  String zOption2;
  String zOption3;
  String zOption4;
  String zImageQuestion;
  String zAnswer;
  String zAnswerDesc;
  List<int> UserChoses;
  QuestionModel({
    this.zQuestion,
    this.zOption1,
    this.zOption2,
    this.zOption3,
    this.zOption4,
    this.zImageQuestion,
    this.zAnswer,
    this.zAnswerDesc,
    this.UserChoses,
}
);
  Map<String,dynamic> toJson(){
    var result=  Map<String,dynamic>() ;
    result["ZQUESTIONCONTENT"]=this.zQuestion;
    result["ZOPTION1"]=this.zOption1;
    result["ZOPTION2"]=this.zOption2;
    result["ZOPTION3"]=this.zOption3;
    result["ZOPTION4"]=this.zOption4;
    result["ZIMAGE"]=this.zImageQuestion;
    result["ZANSWERS"]=this.zAnswer;
    result["ZANSWERDESC"]=this.zAnswerDesc;
    result["UserChoses"]=this.UserChoses;
    return result;

  }
  factory QuestionModel.fromJson(Map<String, dynamic> json){
    return QuestionModel(
      zQuestion: json["ZQUESTIONCONTENT"],
      zOption1: json["ZOPTION1"],
      zOption2: json["ZOPTION2"],
      zOption3: json["ZOPTION3"],
      zOption4: json["ZOPTION4"],
      zImageQuestion: json["ZIMAGE"],
      zAnswer: json["ZANSWERS"],
      zAnswerDesc: json["ZANSWERDESC"],
      UserChoses: json["UserChoses"],
    );
  }

}