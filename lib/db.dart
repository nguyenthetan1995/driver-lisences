import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hoclaixe/models/QuestionModel.dart';

Future<Database> initializeDatabase() async {
  var path = await getDatabasesPath();
  print(path);
  var dbPath = (path + '/' + "data.sqlite");
  print(dbPath);
  print(FileSystemEntity.typeSync(dbPath));

  // copy db file from Assets folder to Documents folder (only if not already there...)
  if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
    ByteData data = await rootBundle.load("assets/databases/data.sqlite");
    print(data);
    writeToFile(data, dbPath);
  } else
    {
      print(FileSystemEntity.typeSync(dbPath));
    }
  // Open/create the database at a given path
  var departuresDatabase = await openDatabase(dbPath);
  print(departuresDatabase.isOpen);
//  List question43 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT,'
//      'ZINDEX,ZANSWERS, ZOPTION1,ZOPTION2,ZOPTION3, ZOPTION4 FROM ZQUESTION '
//      'where ZQUESTIONTYPE = 43 AND ZINDEX <= 21 ');
  List question43 = await departuresDatabase.rawQuery('SELECT * FROM ZQUESTION where ZOPTION4 NOTNULL AND ZIMAGE NOTNULL');

//  print(question43);
//  print(question43.length);
  var ques = question43[Random().nextInt(question43.length)];
  print(ques);
  for (var key in ques.keys) {
    print('$key :  ${ques[key]}');
    print('123');
  }
  return departuresDatabase;
}

Future<QuestionModel> getQuestion(Database departuresDatabase) async {
  var result = new QuestionModel();
  List question43 = await departuresDatabase.rawQuery('SELECT * FROM ZQUESTION where ZOPTION4 NOTNULL AND ZIMAGE NOTNULL');

//  print(question43);
//  print(question43.length);
  var ques = question43[Random().nextInt(question43.length)];
//  print(ques);
  result = QuestionModel.fromJson(ques);
  return result;
}

// HERE IS WHERE THE CODE CRASHES (WHEN TRYING TO WRITE THE LOADED BYTES)
void writeToFile(ByteData data, String path) {
  final buffer = data.buffer;
  new File(path).writeAsBytes(
      buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}
