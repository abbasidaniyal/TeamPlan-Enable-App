import 'package:flutter/material.dart';

class TraffiPolicePage extends StatefulWidget {
  @override
  _TraffiPolicePageState createState() => _TraffiPolicePageState();
}

class _TraffiPolicePageState extends State<TraffiPolicePage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Police"),
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
