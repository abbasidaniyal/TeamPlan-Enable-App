import 'package:enable/pages/city_manager_selector_page.dart';
import 'package:enable/pages/traffic_police_selector_page.dart';
import 'package:enable/widgets/footer.dart';
import 'package:flutter/gestures.dart';
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
        height: MediaQuery.of(context).size.height * 0.40,
        child: FlatButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/policeman.png"),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Traffic Police",
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
          // color: Colors.red,
          // shape: CircleBorder(),
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
            children: <Widget>[
              Image.asset("assets/manager.png"),
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
          ),
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 177, 185, 1),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50.0),
              width: MediaQuery.of(context).size.height * 0.70,
              height: MediaQuery.of(context).size.height * 0.20,
              child: Center(child: Image.asset("assets/logo.png")),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Data Collection Tool",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: MediaQuery.of(context).size.width >=
                        MediaQuery.of(context).size.height
                    ? Axis.horizontal
                    : Axis.vertical,
                child: MediaQuery.of(context).size.width >=
                        MediaQuery.of(context).size.height
                    ? Container(
                        margin: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.03,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: buttonList(),
                        ))
                    : Container(
                        margin: EdgeInsets.symmetric(
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
        ),
      ),
    );
  }
}
