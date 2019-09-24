import 'package:enable/helpers/options.dart';
import 'package:enable/pages/home_page.dart';
import 'package:enable/providers/my_provider.dart';
import 'package:enable/widgets/location_picket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class AccidentFormPage extends StatefulWidget {
  @override
  _AccidentFormPageState createState() => _AccidentFormPageState();
}

class _AccidentFormPageState extends State<AccidentFormPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  Map<String, dynamic> data = {};

  void submitForm() async {
    print(data);
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

  String selectedAccidentTypeValue;
  String selectedDistrictValue;
  String selectedAccidentReasonValue;

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
                child: DropdownButtonFormField<String>(
                  validator: (s) {
                    if (s == null) return "Select District";
                    return null;
                  },
                  decoration: InputDecoration(labelText: "Choose District"),
                  value: selectedDistrictValue,
                  onChanged: (s) {
                    setState(() {
                      selectedDistrictValue = s;
                    });
                  },
                  items:
                      districtsList.map<DropdownMenuItem<String>>((district) {
                    return DropdownMenuItem<String>(
                      child: Text(
                        district,
                      ),
                      value: district,
                    );
                  }).toList(),
                  onSaved: (selected) {
                    data[selected] = selected;
                  },
                ),
              ),
              Container(
                child: DropdownButtonFormField<String>(
                  validator: (s) {
                    if (s == null) return "Select Type of Accident";
                    return null;
                  },
                  decoration:
                      InputDecoration(labelText: "Choose Type of Accident"),
                  value: selectedAccidentTypeValue,
                  onChanged: (s) {
                    setState(() {
                      selectedAccidentTypeValue = s;
                    });
                  },
                  items: typeOfAccident
                      .map<DropdownMenuItem<String>>((accidentType) {
                    return DropdownMenuItem<String>(
                      child: Text(
                        accidentType,
                      ),
                      value: accidentType,
                    );
                  }).toList(),
                  onSaved: (selected) {
                    data[selected] = selected;
                  },
                ),
              ),
              Container(
                child: DropdownButtonFormField<String>(
                  validator: (s) {
                    if (s == null) return "Select Reason of Accident";
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Choose Reason of Accident",
                  ),
                  value: selectedAccidentReasonValue,
                  onChanged: (s) {
                    setState(() {
                      selectedAccidentReasonValue = s;
                    });
                  },
                  items: reasonOfAccident
                      .map<DropdownMenuItem<String>>((accidentReason) {
                    return DropdownMenuItem<String>(
                      child: Text(
                        accidentReason,
                      ),
                      value: accidentReason,
                    );
                  }).toList(),
                  onSaved: (selected) {
                    data[selected] = selected;
                  },
                ),
              ),
              // Container(
              //     child: FormField(
              //   onSaved: (s) {},
              //   validator: (s) {},
              //   builder: (FormFieldState<String> field) {
              //     return PlacesAutocompleteField(
              //       // context: context,
              //       apiKey: "apiKey",
              //       mode: Mode.fullscreen,
              //       types: ["geocoding"],

                    
              //     );
              //   },
              // )),
              LocationPicker(),
              // FormField(
              //   onSaved: (value){
              //     data[value]=value;
              //   },

              // ),
              // SearchMapPlaceWidget(
              //   apiKey: "AIzaSyB0Gc0oMwH4e6jxEZl5I5AawxO7URILG08",
              //   // language: 'en',
              //   onSearch: (place) {
              //     print(place.fullJSON.toString());
              //   },
              //   onSelected: (Place place) async {
              //     print(place.description);
              //     Geolocation geolocation = await place.geolocation;

              //     // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
              //   },
              // ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Location"),
                ),
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
