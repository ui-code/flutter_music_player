import 'package:flutter/material.dart';
import 'package:music_player/pages/home/home.page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        //configure additional pages here
      },
    ),
  );
}
