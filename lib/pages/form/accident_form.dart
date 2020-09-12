import 'package:enable/helpers/options.dart';
import 'package:enable/pages/accepted_page.dart';
import 'package:enable/pages/home_page.dart';
import 'package:enable/providers/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_webservice/geocoding.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AccidentFormPage extends StatefulWidget {
  @override
  _AccidentFormPageState createState() => _AccidentFormPageState();
}

class _AccidentFormPageState extends State<AccidentFormPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  Map<String, dynamic> data = {};
  bool isLoading = false;
  String selectedText;

  void submitForm() async {
    toggle();
    if (_key.currentState.validate()) {
      _key.currentState.save();
      MainProvider model = Provider.of(context);
      bool status = await model.sendAccidentData(data);
      if (status) {
        _key.currentState.reset();
        toggle();
        // Navigator.of(context).popUntil();
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AcceptedPage(model.id);
        }));
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) {
            return HomePageSelector();
          },
        ), (route) => route.isFirst);
      } else {
        toggle();
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Something went wrong"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    } else {
      toggle();
      //THROW ERROR
    }
  }

  void toggle() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  String selectedAccidentTypeValue;
  String selectedDistrictValue;
  String selectedAccidentReasonValue;

  @override
  Widget build(BuildContext context) {
    MainProvider model = Provider.of(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 177, 185, 1),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Form(
          key: _key,
          child: ListView(
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
                                width: MediaQuery.of(context).size.width * 0.05,
                                // height: MediaQuery.of(context).size.height * 0.10,
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
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                child: Text(
                  "Report Accident",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                child: Container(
                  color: Colors.white,
                  child: DropdownButtonFormField<String>(
                    // iconEnabledColor: Colors.white,

                    validator: (s) {
                      if (s == null) return "Select Traffic Division";
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Choose Traffic Division",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                    ),
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
                      data["trafficDivision"] = selected;
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                child: Container(
                  color: Colors.white,
                  child: DropdownButtonFormField<String>(
                    validator: (s) {
                      if (s == null) return "Please Select Type of Accident";
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Choose Type of Accident",
                        border: OutlineInputBorder(),
                        fillColor: Colors.white),
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
                      data["accidentType"] = selected;
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                child: Container(
                  color: Colors.white,
                  child: DropdownButtonFormField<String>(
                    validator: (s) {
                      if (s == null) return "Please Select Reason of Accident";
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Choose Reason of Accident",
                        border: OutlineInputBorder(),
                        fillColor: Colors.white),
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
                      data["accidentReason"] = selected;
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                child: Container(
                  color: Colors.white,
                  child: DateTimeField(
                    format: DateFormat("dd/MM/yyy hh:mm:ss"),
                    focusNode: FocusNode(),
                    onChanged: (s) {
                      // Navigator.pop(context);
                    },
                    style: TextStyle(
                      height: 2,
                    ),
                    onSaved: (s) {
                      data["accidentTime"] = s.toIso8601String();
                    },
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );
                        return DateTimeField.combine(date, time);
                      } else {
                        return currentValue;
                      }
                    },
                    validator: (d) {
                      if (d == null) {
                        return "Date Time Invalid";
                      }
                      if (d.isAfter(DateTime.now())) return "Date is in Future";
                      return null;
                    },
                    autofocus: false,
                    decoration: InputDecoration(
                        labelText: "Date and Time of Accident",
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        hasFloatingPlaceholder: false),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border()),
                // height: MediaQuery.of(context).size.height * 0.1,
                child: Container(
                  color: Colors.white,
                  child: FormField<Map<String, dynamic>>(
                    validator: (s) {
                      if (s == null) return "Please Enter Location Address";

                      return null;
                    },
                    onSaved: (s) {
                      data["address"] = s["address"];
                      data["location"] = {
                        "latitude": s["latitude"],
                        "longitude": s["longiude"],
                      };
                    },
                    builder: (FormFieldState<Map<String, dynamic>> state) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: InkWell(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Location",
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                            ),
                            controller:
                                TextEditingController(text: selectedText),
                            enabled: false,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedText == null
                                  ? Colors.black.withOpacity(0.8)
                                  : Colors.black,
                            ),
                          ),
                          onTap: () async {
                            final p = await PlacesAutocomplete.show(
                              context: context,
                              apiKey: MainProvider.apiKey,
                              components: [Component(Component.country, "in")],
                            ).catchError((onError) {
                              return;
                            });
                            setState(() {
                              selectedText = p?.description ?? null;
                            });

                            final geocoding = GoogleMapsPlaces(
                              apiKey: MainProvider.apiKey,
                            );

                            PlacesDetailsResponse data = await geocoding
                                .getDetailsByPlaceId(p?.placeId)
                                .catchError((onError) {
                              return;
                            });
                            Map<String, dynamic> addressData = {
                              "address": p?.description,
                              "longiude": data?.result?.geometry?.location?.lng,
                              "latitude": data?.result?.geometry?.location?.lat,
                            };

                            state.didChange(addressData);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                width: MediaQuery.of(context).size.width * 0.50,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                  color: Colors.grey,
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          "Submit",
                          style: TextStyle(color: Colors.black),
                        ),
                  onPressed: isLoading ? () {} : submitForm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
