import 'package:enable/pages/home_page.dart';
import 'package:enable/providers/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccidentFormPage extends StatefulWidget {
  @override
  _AccidentFormPageState createState() => _AccidentFormPageState();
}

class _AccidentFormPageState extends State<AccidentFormPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  Map<String, dynamic> data = {};

  void submitForm() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      MainProvider model = Provider.of(context);
      bool status = await model.sendAccidentData(data);
      if (status) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return HomePageSelector();
        }));
      }
    } else {
      //THROW ERROR
    }
  }

  List<String> districts = [
    'Faraskhana',
    'Koregaon',
    'Kothrud',
    'Lashkar',
    'Sahakar Nagar',
    'Samartha',
    'Shivaji Nagar',
    'Vishrambag',
    'Yerwada',
    'Chaturshrungi',
    'Khadaki',
    'Vimantal',
    'Hadapsar',
    'Wanwadi',
    'Lashkar',
    'Swargate',
    'Bundgarden',
    'Warje',
    'Deccan',
    'Dattawadi',
    'Bharati Vidyapeeth',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Police : Accident Report"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Form(
          key: _key,
          child: ListView(
            children: <Widget>[
              Container(
                // child: DropdownButtonFormField<String>(
                child: DropdownButton(
                  // onSaved: (x) {},
                  // decoration:
                  // InputDecoration(labelText: "District", enabled: true),
                  // validator: (x) {
                  //   if (x == null) return "Error";

                  //   return null;
                  // },
                  items: districts.map((district) {
                    return DropdownMenuItem<String>(
                      child: Text(
                        district,
                      ),
                      value: district,
                    );
                  }).toList(),
                ),
              ),
              Container(
                child: TextFormField(),
              ),
              Container(
                child: TextFormField(),
              ),
              Container(
                child: TextFormField(),
              ),
              RaisedButton(
                child: Text("Submit"),
                onPressed: submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
