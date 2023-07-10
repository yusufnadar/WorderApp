// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../../common/models/words_model.dart';
import '../../mixins/show_bar.dart';

class DatabaseHelperService with ShowBar {
  static Database? _database;

  DatabaseHelperService._init();

  static final DatabaseHelperService instance = DatabaseHelperService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await init();
    return _database!;
  }

  static Future<Database> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'englishWords.db');
    var exists = await databaseExists(path);
    if (!exists) {
      var data = await rootBundle.load(
        join('assets', 'db', 'englishWords.db'),
      );
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(path).writeAsBytes(bytes, flush: true);
    }
    return await openDatabase(path, readOnly: false);
  }

  Future<List<WordsModel>?> getWords(filter) async {
    try {
      final db = await database;
      var res = await db.rawQuery(
        'SELECT word, meaning, id, (select count(*) from favorites where wordId = words.id) as favorite from words $filter',
      );
      if (res.isNotEmpty) {
        return List<WordsModel>.from(
          res.map((e) => WordsModel().fromJson(e)),
        );
      }
    } catch (error) {
      showErrorBar('Unknown error');
    }
    return null;
  }

  Future<List<WordsModel>?> getFavorites() async {
    try {
      final db = await database;
      var res = await db.rawQuery(
        'SELECT word, meaning, id, (select count(*) from favorites where wordId = words.id) as favorite from words where favorite = 1',
      );
      if (res.isNotEmpty) {
        return List<WordsModel>.from(
          res.map((e) => WordsModel().fromJson(e)),
        );
      }
    } catch (error) {
      showErrorBar('Unknown error');
    }
    return null;
  }

  Future addWord(String word, String meaning) async {
    try {
      final db = await database;
      var res = await db.rawInsert(
        'INSERT INTO words (word, meaning) VALUES ("$word","$meaning");',
      );
      return res;
    } on DatabaseException catch (error) {
      if (error.isUniqueConstraintError()) {
        showErrorBar('Your list contains the same word or meaning');
      } else {
        showErrorBar('Unknown error');
      }
    } catch (error) {
      showErrorBar('Unknown error');
    }
    return false;
  }

  Future deleteWord(id) async {
    try {
      final db = await database;
      var res = await db.rawDelete('DELETE from words where id = $id');
      await db.rawDelete('DELETE from favorites where wordId = $id');
      return res;
    } catch (error) {
      showErrorBar('Unknown error');
    }
    return false;
  }

  Future editWord(id, String word, String meaning) async {
    try {
      final db = await database;
      var res = await db.rawUpdate(
        'UPDATE words SET word = "$word", meaning = "$meaning" WHERE id = $id',
      );
      return res;
    } on DatabaseException catch (error) {
      if (error.isUniqueConstraintError()) {
        showErrorBar('Your list contains the same word or meaning');
      } else {
        showErrorBar('Unknown error');
      }
    } catch (error) {
      showErrorBar('Unknown error');
    }
    return false;
  }

  Future addOrDeleteFavourite(WordsModel item) async {
    try {
      final db = await database;
      if (item.favorite == true) {
        await db.rawDelete('DELETE from favorites where wordId = ${item.id}');
        return true;
      } else {
        await db.rawInsert(
          'INSERT INTO favorites (wordId) VALUES ("${item.id}");',
        );
        return true;
      }
    } catch (error) {
      showErrorBar('Unknown error');
    }
    return false;
  }
}
