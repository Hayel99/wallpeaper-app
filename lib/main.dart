import 'package:flutter/material.dart';
import 'package:wallpaper/providers/getphotos.dart';
import 'package:wallpaper/screens/favorites.dart';
import 'package:wallpaper/screens/home.dart';
import 'package:wallpaper/screens/search.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PhotodProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
