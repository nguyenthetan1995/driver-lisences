import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import 'package:test_license_driver/model/SignTypeModel.dart';
import 'model/QuestionModel.dart';
import 'model/QuestionTypeModel.dart';
import 'model/SignModel.dart';

Future<Database> initializeDatabase() async {
  var path = await getDatabasesPath();
  var dbPath = (path + '/' + 'data.sqlite');

  if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
    ByteData data = await rootBundle.load("assets/databases/data.sqlite");
    writeToFile(data, dbPath);
  } else {
    print('Database is ready!!');
    print(FileSystemEntity.typeSync(dbPath));
  }
  var departuresDatabase = await openDatabase(dbPath);
  return departuresDatabase;
}

void writeToFile(ByteData data, String path) {
  final buffer = data.buffer;
  new File(path)
      .writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}

Future<List<SignTypeModel>> getListSignType(
    Database departuresDatabase) async {
  var listSignType = new List<SignTypeModel>();
  List signTypes =
  await departuresDatabase.rawQuery('SELECT ZNAME FROM ZSIGNCATEGORY');
  for (var signType in signTypes) {
    listSignType.add(SignTypeModel.fromJson(signType));
  }
  return (listSignType);
}


Future<List<SignModel>> getListSign(
    Database departuresDatabase, int typeSign) async {
  var listSign = new List<SignModel>();
  List signs = await departuresDatabase
      .rawQuery('SELECT * FROM ZSIGN WHERE ZSIGNCATEGORY = $typeSign');
  for (var sign in signs) {
    listSign.add(SignModel.fromJson(sign));
  }
  print(listSign.length);
  return (listSign);
}

Future<List<QuestionTypeModel>> getListQuestionType(
    Database departuresDatabase) async {
  var listQuestionType = new List<QuestionTypeModel>();
  List questionTypes =
      await departuresDatabase.rawQuery('SELECT * FROM ZQUESTIONTYPE');
  for (var questionType in questionTypes) {
    listQuestionType.add(QuestionTypeModel.fromJson(questionType));
  }
  print(questionTypes);
  return (listQuestionType);
}

Future<List<QuestionModel>> getListQuestion(
    Database departuresDatabase, int typeQuestion) async {
  var listQuestion = new List<QuestionModel>();
  List questions = await departuresDatabase
      .rawQuery("SELECT * FROM ZQUESTION WHERE ZQUESTIONTYPE = $typeQuestion");
  for (var question in questions) {
    listQuestion.add(QuestionModel.fromJson(question));
  }
  return (listQuestion);
}
