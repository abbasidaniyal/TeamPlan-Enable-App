import 'package:enable/pages/city_manager_selector_page.dart';
import 'package:enable/pages/home_page.dart';
import 'package:enable/pages/traffic_police_selector_page.dart';
import 'package:enable/widgets/footer.dart';
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
        width: MediaQuery.of(context).orientation==Orientation.landscape? MediaQuery.of(context).size.width * 0.30:MediaQuery.of(context).size.width * 0.50,
        
        height: MediaQuery.of(context).size.height * 0.15,
        child: TextField(
          controller: username,
          decoration: InputDecoration(
            labelText: "Username",
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
      // SizedBox(
      //   height:
      //       MediaQuery.of(context).orientation == Orientation.portrait ? 50 : 0,
      // ),
      Container(
        width: MediaQuery.of(context).orientation==Orientation.landscape? MediaQuery.of(context).size.width * 0.30:MediaQuery.of(context).size.width * 0.50,
        height: MediaQuery.of(context).size.height * 0.15,
        child: TextField(
          controller: password,
          obscureText: true,
          decoration: InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.black)),
        ),
      ),
      Container(
        width: MediaQuery.of(context).orientation==Orientation.portrait? MediaQuery.of(context).size.width * 0.5:MediaQuery.of(context).size.width * 0.30,
        height: MediaQuery.of(context).size.height * 0.1,
        child: RaisedButton(
          color: Colors.red,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Submit",
              // maxLines: 2,
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
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50.0),
            width: MediaQuery.of(context).size.width,
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
          footer(context)[0],
          footer(context)[1]
        ],
      ),
    );
  }
}
