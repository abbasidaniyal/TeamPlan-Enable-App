import 'package:enable/pages/form/accident_form.dart';
import 'package:enable/pages/form/noc_form.dart';
import 'package:enable/widgets/footer.dart';
import 'package:flutter/material.dart';

class TrafficPolicePageSelector extends StatefulWidget {
  @override
  _TrafficPolicePageSelectorState createState() =>
      _TrafficPolicePageSelectorState();
}

class _TrafficPolicePageSelectorState extends State<TrafficPolicePageSelector> {
  List<Widget> buttonList() {
    return <Widget>[
      Container(
        width: MediaQuery.of(context).size.height * 0.30,
        height: MediaQuery.of(context).size.height * 0.40,
        child: FlatButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 25.0),
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Image.asset("assets/accident.png")),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Report Accident",
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
      SizedBox(
        width: MediaQuery.of(context).orientation == Orientation.landscape
            ? 200
            : 0,
        height:
            MediaQuery.of(context).orientation == Orientation.portrait ? 50 : 0,
      ),
      Container(
        width: MediaQuery.of(context).size.height * 0.30,
        height: MediaQuery.of(context).size.height * 0.40,
        child: FlatButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 25.0),
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Image.asset("assets/policeman.png")),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "No Objection Certificate",
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return NOCFormPage();
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
      backgroundColor: Color.fromRGBO(0, 177, 185, 1),
      body: ListView(
        children: <Widget>[
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
                    width: MediaQuery.of(context).size.width * 0.20,
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
                            width: MediaQuery.of(context).size.width * 0.05,
                            child: Image.asset("assets/policeman.png")),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Traffic Police",
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.5,
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
                          horizontal: MediaQuery.of(context).size.width * 0.05),
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
          footer(context)[0],
          footer(context)[1]
        ],
      ),
    );
  }
}
