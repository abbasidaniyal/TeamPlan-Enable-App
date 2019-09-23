import 'package:enable/pages/city_manager_page.dart';
import 'package:enable/pages/traffic_police.dart';
import 'package:flutter/material.dart';

class HomePageSelector extends StatefulWidget {
  @override
  _HomePageSelectorState createState() => _HomePageSelectorState();
}

class _HomePageSelectorState extends State<HomePageSelector> {
  List<Widget> buttonList() {
    return <Widget>[
      Container(
        width: MediaQuery.of(context).size.height * 0.30,
        height: MediaQuery.of(context).size.height * 0.30,
        child: RaisedButton(
          child: Text(
            "Traffic Police",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.red,
          shape: CircleBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return TraffiPolicePage();
              }),
            );
          },
        ),
      ),
      SizedBox(
        width: 50.0,
        height: 50.0,
      ),
      Container(
        width: MediaQuery.of(context).size.height * 0.30,
        height: MediaQuery.of(context).size.height * 0.30,

        // alignment: Alignment.center,
        child: RaisedButton(
          shape: CircleBorder(),
          child: Text(
            "City Manager",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return CityManagerPage();
              }),
            );
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enable App"),
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width >=
                MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width * 40
            : MediaQuery.of(context).size.width * 0.80,
        height: MediaQuery.of(context).size.width >=
                MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.height * 0.5
            : MediaQuery.of(context).size.height * 0.90,
        child: SingleChildScrollView(
          scrollDirection: MediaQuery.of(context).size.width >=
                  MediaQuery.of(context).size.height
              ? Axis.horizontal
              : Axis.vertical,
          child: MediaQuery.of(context).size.width >=
                  MediaQuery.of(context).size.height
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: buttonList())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: buttonList()),
        ),
      ),
    );
  }
}
