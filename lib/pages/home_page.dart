import 'package:enable/pages/city_manager_page.dart';
import 'package:enable/pages/traffic_police.dart';
import 'package:flutter/material.dart';

class HomePageSelector extends StatefulWidget {
  @override
  _HomePageSelectorState createState() => _HomePageSelectorState();
}

class _HomePageSelectorState extends State<HomePageSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enable App"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.35,
          vertical: MediaQuery.of(context).size.height * 0.25,
        ),
        child: Center(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                // alignment: Alignment.center,
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
              ),
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
