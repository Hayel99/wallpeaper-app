import 'package:flutter/material.dart';
import 'package:wallpaper/providers/getphotos.dart';
import 'package:wallpaper/screens/favorites.dart';
import 'package:wallpaper/screens/home.dart';
import 'package:wallpaper/screens/photo.dart';
import 'package:wallpaper/screens/search.dart';
import 'package:provider/provider.dart';

import 'models/photo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  Photos? photos;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
