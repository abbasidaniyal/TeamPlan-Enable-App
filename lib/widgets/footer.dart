import 'package:flutter/material.dart';

List<Widget> footer(context) {
  return [
    Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        "Supported By :- ",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
    Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(bottom: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image.asset("assets/iscf_logo.png")),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image.asset("assets/smart_cities_logo.png")),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image.asset("assets/pune-smart-city_logo.jpg")),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image.asset("assets/pune_police_logo.png")),
          ],
        ),
      ),
    ),
  ];
}
