import 'package:enable/pages/city_manager_selector_page.dart';
import 'package:enable/pages/home_page.dart';
import 'package:enable/pages/traffic_police_selector_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPageSelector extends StatefulWidget {
  @override
  _LoginPageSelectorState createState() => _LoginPageSelectorState();
}

class _LoginPageSelectorState extends State<LoginPageSelector> {
  TextEditingController username = TextEditingController(),
      password = TextEditingController();

  List<Widget> buttonList() {
    return <Widget>[
      Container(
        width: MediaQuery.of(context).size.height * 0.30,
        height: MediaQuery.of(context).size.height * 0.1,
        child: TextField(
          controller: username,
          decoration: InputDecoration(labelText: "Username"),
        ),
      ),
      SizedBox(
        height:
            MediaQuery.of(context).orientation == Orientation.portrait ? 50 : 0,
      ),
      Container(
        width: MediaQuery.of(context).size.height * 0.30,
        height: MediaQuery.of(context).size.height * 0.1,
        child: TextField(
          controller: password,
          obscureText: true,
          decoration: InputDecoration(labelText: "Password"),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.height * 0.30,
        height: MediaQuery.of(context).size.height * 0.1,
        child: RaisedButton(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Submit",
              textAlign: TextAlign.center,
              textScaleFactor: 2,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
              ),
            ),
          ),
          onPressed: () {
            print(username.text + password.text);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return HomePageSelector();
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
                "LOGIN SCREEN",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.symmetric(
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
          ],
        ),
      ),
    );
  }
}
