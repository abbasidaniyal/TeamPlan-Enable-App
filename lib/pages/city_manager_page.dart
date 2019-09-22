

import 'package:flutter/material.dart';

class CityManagerPage extends StatefulWidget {
  @override
  _CityManagerPageState createState() => _CityManagerPageState();
}

class _CityManagerPageState extends State<CityManagerPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City Manager"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Form(
          key: _key,
          child: ListView(
            children: <Widget>[
              Container(
                child: TextFormField(),
              ),
              Container(
                child: TextFormField(),
              ),
              Container(
                child: TextFormField(),
              ),
              Container(
                child: TextFormField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
