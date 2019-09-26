import 'package:enable/pages/home_page.dart';
import 'package:flutter/material.dart';

class AcceptedPage extends StatelessWidget {
  final String id;
  AcceptedPage(this.id);
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 177, 185, 1),
      body: Column(
        children: <Widget>[
          Image.asset("assets/success.gif"),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Success!",
              textScaleFactor: 2,
            ),
          ),
          Container(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "Thank you for your response!",
              textScaleFactor: 1.5,
            ),
          ),
          Container(
            padding: EdgeInsets.all(2.0),
            child: Text("Your ID : " + id),
          ),
          RaisedButton(
              child: Text("Okay"),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) {
                    return HomePageSelector();
                  },
                ), (route) => route.isFirst);
              }),
        ],
      ),
    );
  }
}
