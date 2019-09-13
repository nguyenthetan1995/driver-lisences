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
  QuestionModel({
    this.zQuestion,
    this.zOption1,
    this.zOption2,
    this.zOption3,
    this.zOption4,
    this.zImageQuestion,
    this.zAnswer,
    this.zAnswerDesc,
});
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
    );
  }
}