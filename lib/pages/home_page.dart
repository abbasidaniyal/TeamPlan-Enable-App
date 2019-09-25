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
      Container(
        width: MediaQuery.of(context).size.height * 0.30,
        height: MediaQuery.of(context).size.height * 0.30,
        child: FlatButton(
          // child: Text(
          //   "Traffic Police",
          //   textScaleFactor: 1.5,
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     color: Colors.white,
          //   ),
          // ),
          child: Image.asset("assets/policeman.png"),
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
        height: MediaQuery.of(context).size.height * 0.30,
        child: FlatButton(
          // shape: CircleBorder(),
          // child: Text(
          //   "City Manager",
          //   textAlign: TextAlign.center,
          //   textScaleFactor: 1.5,
          //   style: TextStyle(
          //     color: Colors.white,
          //   ),
          // ),
          child: Image.asset("assets/manager.png"),
          // color: Colors.blue,
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
      // appBar: AppBar(
      //   title: Text("Enable App"),
      //   backgroundColor: Color.fromRGBO(0, 177, 185, 1),
      // ),
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
                    fontWeight: FontWeight.bold),
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
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.05,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.20),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
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
            Container(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: <Widget>[
                  Container(child: Image.asset("assets/iscf_logo.png")),
                  Container(child: Image.asset("assets/pune_police_logo.png")),
                  Container(child: Image.asset("assets/pune-smart-city_logo.jpg")),
                  Container(child: Image.asset("assets/smart_cities_logo.png")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
