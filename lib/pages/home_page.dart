import 'package:enable/pages/city_manager_selector_page.dart';
import 'package:enable/pages/traffic_police_selector_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePageSelector extends StatefulWidget {
  @override
  _HomePageSelectorState createState() => _HomePageSelectorState();
}

class _HomePageSelectorState extends State<HomePageSelector> {
  List<Widget> buttonList() {
    return <Widget>[
      ClipOval(
        child: Container(
          width: MediaQuery.of(context).size.height * 0.30,
          height: MediaQuery.of(context).size.height * 0.30,
          child: RaisedButton(
            child: Text(
              "Traffic Police",
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
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
                  return TrafficPolicePageSelector();
                }),
              );
            },
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).orientation == Orientation.landscape
            ? 50
            : 0,
        height:
            MediaQuery.of(context).orientation == Orientation.portrait ? 50 : 0,
      ),
      ClipOval(
        child: Container(
          width: MediaQuery.of(context).size.height * 0.30,
          height: MediaQuery.of(context).size.height * 0.30,
          child: RaisedButton(
            shape: CircleBorder(),
            child: Text(
              "City Manager",
              textAlign: TextAlign.center,
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
                  return CityManagerSelectorPage();
                }),
              );
            },
          ),
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: MediaQuery.of(context).size.width >=
                  MediaQuery.of(context).size.height
              ? Axis.horizontal
              : Axis.vertical,
          child: MediaQuery.of(context).size.width >=
                  MediaQuery.of(context).size.height
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.10,
                      horizontal: MediaQuery.of(context).size.width * 0.20),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: buttonList()))
              : Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.1,
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: buttonList())),
        ),
      ),
    );
  }
}
