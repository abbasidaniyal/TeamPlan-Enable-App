import 'package:enable/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        accentColor: Colors.white,
        primaryColor: Colors.black,
      ),
      home: HomePageSelector(),
    );
  }
}
