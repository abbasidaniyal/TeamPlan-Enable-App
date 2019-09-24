import 'package:enable/pages/city_manager_page.dart';
import 'package:enable/pages/form/accident_form.dart';
import 'package:flutter/material.dart';

class TrafficPolicePageSelector extends StatefulWidget {
  @override
  _TrafficPolicePageSelectorState createState() =>
      _TrafficPolicePageSelectorState();
}

class _TrafficPolicePageSelectorState extends State<TrafficPolicePageSelector> {
  List<Widget> buttonList() {
    return <Widget>[
      ClipOval(
        child: Container(
          width: MediaQuery.of(context).size.height * 0.30,
          height: MediaQuery.of(context).size.height * 0.30,
          child: RaisedButton(
            child: Center(
              child: Text(
                "Accident",
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            color: Colors.red,
            shape: CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AccidentFormPage();
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

          // alignment: Alignment.center,
          child: RaisedButton(
            // shape: CircleBorder(),
            child: Center(
              child: Text(
                "No Objection Certificate (NOC)",
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  
                ),
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
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Police: Type of Issue"),
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
