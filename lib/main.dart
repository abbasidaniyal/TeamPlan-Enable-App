import 'package:enable/pages/login_page.dart';
import 'package:enable/providers/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) {
        return MainProvider();
      },
      child: MaterialApp(
        theme: ThemeData(
          accentColor: Colors.black,
          primaryColor: Color.fromRGBO(0, 177, 185, 1),
        ),
        home: LoginPageSelector(),
      ),
    );
  }
}
