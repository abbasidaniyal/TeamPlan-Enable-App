import 'package:enable/helpers/options.dart';
import 'package:enable/pages/home_page.dart';
import 'package:enable/providers/my_provider.dart';
import 'package:enable/widgets/location_picket.dart';
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
      print(data);
      MainProvider model = Provider.of(context);
      bool status = await model.sendAccidentData(data);
      if (status) {
        _key.currentState.dispose();
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return HomePageSelector();
        }));
      } else {
        toggle();
      }
    } else {
      toggle();
      //THROW ERROR
    }
  }

  toggle() {
    setState(() {
      isLoading = !isLoading;
    });
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
                    if (s == null) return "Select Traffic Division";
                    return null;
                  },
                  decoration:
                      InputDecoration(labelText: "Choose Traffic Division"),
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
                    data["traffic_division"] = selected;
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
                    data["type_of_accident"] = selected;
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
                    data["reason_of_accident"] = selected;
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.5))
                ),
                
                height: MediaQuery.of(context).size.height * 0.1,
                child: FormField<Map<String, dynamic>>(
                  onSaved: (s) {
                    data["address"] = s["address"];
                    data["geocode"] = [
                      {
                        "latitude": s["latitude"],
                        "longitude": s["longiude"],
                      }
                    ];
                  },
                  
                  initialValue: null,
                  builder: (FormFieldState<Map<String, dynamic>> state) {
                    return InkWell(
                      
                      child: Text(
                        selectedText == null ? "Location" : selectedText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.5)
                        ),
                        
                      ),
                      onTap: () async {
                        final p = await PlacesAutocomplete.show(
                          context: context,
                          apiKey: "AIzaSyD-bXnAW-uMa2qWIw4EVT_h-pkoJAx6Gx8",
                          components: [Component(Component.country, "in")],
                        );
                        final geocoding = GoogleMapsPlaces(
                          apiKey: "AIzaSyD-bXnAW-uMa2qWIw4EVT_h-pkoJAx6Gx8",
                        );

                        setState(() {
                          selectedText = p.description;
                        });

                        PlacesDetailsResponse data =
                            await geocoding.getDetailsByPlaceId(p.placeId);

                        print(data.result.geometry.location.lat);
                        print(data.result.geometry.location.lng);

                        Map<String, dynamic> addressData = {
                          "address": p.description,
                          "longiude": data.result.geometry.location.lng,
                          "latitude": data.result.geometry.location.lat,
                        };

                        state.didChange(addressData);
                      },
                    );
                  },
                ),
              ),
              Container(
                child: DateTimePickerFormField(
                
                  format: DateFormat("dd/MM/yyy hh:mm:ss"),
                  inputType: InputType.both,
                  style: TextStyle(
                    
                    height: 2,
                
                  ),
                  editable: false,
                  validator: (d) {
                    if (d == null || d.isAfter(DateTime.now())) {
                      return "Date Time Invalid";
                    }
                    return null;
                  },
                  resetIcon: null,
                  decoration: InputDecoration(
                      labelText: "Date and Time", hasFloatingPlaceholder: true),
                ),
              ),
              RaisedButton(
                child: isLoading ? CircularProgressIndicator() : Text("Submit"),
                onPressed: isLoading ? () {} : submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
