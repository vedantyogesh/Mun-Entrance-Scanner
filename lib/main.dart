import 'package:flutter/material.dart';
import 'package:muncode/src/pages/home_screen_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Generator-Scanner',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
