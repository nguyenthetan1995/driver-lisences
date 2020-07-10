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

  bool Option1;
  bool Option2;
  bool Option3;
  bool Option4;

  String zImageQuestion;
  String zAnswer;
  String zQuestionDie;
  String zAnswerDesc;
  bool IsFinish;
  int UserChoses;
  QuestionModel({
    this.zQuestion,
    this.zOption1,
    this.zOption2,
    this.zOption3,
    this.zOption4,

    this.Option1,
    this.Option2,
    this.Option3,
    this.Option4,

    this.zImageQuestion,
    this.zAnswer,
    this.zAnswerDesc,
    this.IsFinish,
    this.zQuestionDie,
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

    result["OPTION1"]=this.Option1;
    result["OPTION2"]=this.Option2;
    result["OPTION3"]=this.Option3;
    result["OPTION4"]=this.Option4;

    result["ZIMAGE"]=this.zImageQuestion;
    result["ZANSWERS"]=this.zAnswer;
    result["ZQUESTIONDIE"]=this.zQuestionDie;
    result["ZANSWERDESC"]=this.zAnswerDesc;
    result["ISFINISH"]=this.IsFinish;
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

      Option1:json["OPTION1"],
      Option2:json["OPTION2"],
      Option3:json["OPTION3"],
      Option4:json["OPTION4"],

      zImageQuestion: json["ZIMAGE"],
      zAnswer: json["ZANSWERS"],
      zQuestionDie: json["ZQUESTIONDIE"],
      zAnswerDesc: json["ZANSWERDESC"],
      IsFinish: json["ISFINISH"],
      UserChoses: json["UserChoses"],
    );
  }

}