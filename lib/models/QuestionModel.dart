import 'dart:convert';

/*'''SELECT ZQUESTIONCONTENT,'
      'ZINDEX,ZANSWERS, ZOPTION1,ZOPTION2,ZOPTION3, ZOPTION4 FROM ZQUESTION '''*/
QuestionModel questionFromJson(String str) {
  final jsonData = json.decode(str);
  return QuestionModel.fromJson(jsonData);
}

String clientToJson(QuestionModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class QuestionModel {
  String zQuestion;
  String zAnswers;
  String zAnswerDesc;
  String zOption1;
  String zOption2;
  String zOption3;
  String zOption4;
  String zImage;
  int zIndex;
  QuestionModel(
      {this.zQuestion,
      this.zAnswers,
      this.zAnswerDesc,
      this.zOption1,
      this.zOption2,
      this.zOption3,
      this.zOption4,
      this.zImage,
        this.zIndex,});
  Map<String, dynamic> toJson() => {
        "ZQUESTIONCONTENT": zQuestion,
        "ZINDEX": zIndex,
      };
  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      zQuestion: json["ZQUESTIONCONTENT"] as String,
      zAnswers: json["ZANSWERS"],
      zAnswerDesc: json["ZANSWERDESC"],
      zOption1: json["ZOPTION1"],
      zOption2: json["ZOPTION2"],
      zOption3: json["ZOPTION3"],
      zOption4: json["ZOPTION4"],
      zImage: json["ZIMAGE"],
      zIndex: json["ZINDEX"] as int,
    );
  }
}
