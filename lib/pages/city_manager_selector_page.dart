
import 'package:enable/pages/form/accident_form.dart';
import 'package:enable/pages/form/encroachment_form.dart';
import 'package:enable/pages/form/pot_holes_form.dart';
import 'package:flutter/material.dart';

class CityManagerSelectorPage extends StatefulWidget {
  @override
  _CityManagerSelectorPageState createState() =>
      _CityManagerSelectorPageState();
}

class _CityManagerSelectorPageState extends State<CityManagerSelectorPage> {
  List<Widget> buttonList() {
    return <Widget>[
      ClipOval(
        child: Container(
          width: MediaQuery.of(context).size.height * 0.30,
          height: MediaQuery.of(context).size.height * 0.30,
          child: RaisedButton(
            child: Text(
              "Encroachment",
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.red,
            // shape: CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return EncroachmentFormPage();
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
            child: Text(
              "Water Logging/Pot Holes",
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return PotHoleFormPage();
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
            child: Text(
              "Traffic Light",
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.yellow,
            onPressed: () {},
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
            child: Text(
              "Street Light",
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.green,
            onPressed: () {},
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City Manager : Type of Issue"),
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
                    children: buttonList(),
                  ),
                ),
        ),
      ),
    );
  }
}
