import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../myphotos.dart';

class PhotodProvider extends ChangeNotifier {
  List<dynamic> _photos = [];
  List<dynamic> get photos => _photos;

  Future<void> fetchPhotos() async {
    final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/curated/?page=1&per_page=15'),
      headers: {
        'Authorization':
            'b3WwMrMkCQsgW9JBZ5NENB65tJqxAECGtXTqICybIjTUm7FiTo3PkmhC',
        'Cookie':
            '__cf_bm=4Cj2vF3wzpIYuJVpyvMnt6moC.NR_5JwLn9JW7sWk8s-1682112127-0-ASrRI81KTsp7H6oWHIMuuGEKkbYsQ8du40cD5y8LOdMYx69KSiVMcIn9OJkASr1OLTtfdPG1Xw5PfpwX/ECuwkc='
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      _photos = data['photos'];
      notifyListeners();
    } else {
      throw Exception('Failed to fetch photos');
    }
  }

  late Database database;
  openDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'photo.db');
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      print('Creating Photo table');
      try {
        await db.execute(
            'CREATE TABLE Photo (id INTEGER PRIMARY KEY AUTOINCREMENT, src TEXT, photographer TEXT)');
        print('Photo table created successfully');
      } catch (e) {
        print('Error creating Photo table: $e');
      }
    });
  }

  Future<void> insertPhoto(MyPhotos photo) async {
    final db = await database;
    await openDb();
    await db.insert(
      'Photo',
      photo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<MyPhotos>> getPhotos() async {
    await openDb();
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Photo');
    return List.generate(maps.length, (i) {
      return MyPhotos(
        id: maps[i]['id'],
        src: maps[i]['src'],
        photographer: maps[i]['photographer'],
      );
    });
  }
}
