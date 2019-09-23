import 'package:enable/pages/home_page.dart';
import 'package:enable/providers/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // value: MainProvider(),
      builder: (context) {
        return MainProvider();
      },
      // value: (),
      child: MaterialApp(
        theme: ThemeData(
          accentColor: Colors.white,
          primaryColor: Colors.black,
        ),
        home: HomePageSelector(),
      ),
    );
  }
}
