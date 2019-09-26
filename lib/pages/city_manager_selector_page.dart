import 'package:enable/pages/form/accident_form.dart';
import 'package:enable/pages/form/pot_holes_form.dart';
import 'package:enable/pages/form/water_logging_form.dart';
import 'package:enable/widgets/footer.dart';
import 'package:flutter/material.dart';

class CityManagerSelectorPage extends StatefulWidget {
  @override
  _CityManagerSelectorPageState createState() =>
      _CityManagerSelectorPageState();
}

class _CityManagerSelectorPageState extends State<CityManagerSelectorPage> {
  List<Widget> buttonList() {
    return <Widget>[
      Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.40,
        child: FlatButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 25.0),
                  // width: MediaQuery.of(context).size.width * 0.10,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Image.asset("assets/waterlogging.png")),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Report Water Logging",
                  textAlign: TextAlign.center,
                  textScaleFactor: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ],
          ),
          // shape: CircleBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return WaterLoggingFormPage();
              }),
            );
          },
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).orientation == Orientation.landscape
            ? 50
            : 0,
        height:
            MediaQuery.of(context).orientation == Orientation.portrait ? 50 : 0,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.40,
        child: FlatButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 25.0),
                  // width: MediaQuery.of(context).size.width * 0.10,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Image.asset("assets/potholes.png")),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Report Pot Holes",
                  textAlign: TextAlign.center,
                  textScaleFactor: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ],
          ),
          // shape: CircleBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return PotholesFormPage();
              }),
            );
          },
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).orientation == Orientation.landscape
            ? 50
            : 0,
        height:
            MediaQuery.of(context).orientation == Orientation.portrait ? 50 : 0,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.20,
        height: MediaQuery.of(context).size.height * 0.40,
        child: FlatButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 25.0),
                  // width: MediaQuery.of(context).size.width * 0.10,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Image.asset("assets/traffic-lights.png")),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Report Faulty Signals",
                  textAlign: TextAlign.center,
                  textScaleFactor: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).orientation == Orientation.landscape
            ? 50
            : 0,
        height:
            MediaQuery.of(context).orientation == Orientation.portrait ? 50 : 0,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 177, 185, 1),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      // margin: EdgeInsets.only(top: 10.0),
                      width: MediaQuery.of(context).size.width * 0.20,
                      // height: MediaQuery.of(context).size.height * 0.10,
                      child: Image.asset("assets/logo.png"),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Data Collection Tool",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.60,
                ),
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 25.0),
                              width: MediaQuery.of(context).size.width * 0.10,
                              // height: MediaQuery.of(context).size.height * 0.10,
                              child: Image.asset("assets/manager.png")),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "City Manager",
                              textAlign: TextAlign.center,
                              textScaleFactor: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
            Container(
              alignment: Alignment.center,
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.5,
              child: SingleChildScrollView(
                scrollDirection: MediaQuery.of(context).size.width >=
                        MediaQuery.of(context).size.height
                    ? Axis.horizontal
                    : Axis.vertical,
                child: MediaQuery.of(context).size.width >=
                        MediaQuery.of(context).size.height
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.10,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: buttonList()))
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.1,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: buttonList())),
              ),
            ),
            footer(context)[0],
            footer(context)[1]
          ],
        ));
  }
}
