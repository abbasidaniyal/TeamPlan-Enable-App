import 'package:enable/helpers/options.dart';
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

class PotholesFormPage extends StatefulWidget {
  @override
  _PotholesFormPageState createState() => _PotholesFormPageState();
}

class _PotholesFormPageState extends State<PotholesFormPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  Map<String, dynamic> data = {};
  bool isLoading = false;
  String selectedText;

  void submitForm() async {
    toggle();
    if (_key.currentState.validate()) {
      _key.currentState.save();
      MainProvider model = Provider.of(context);
      bool status = await model.sendPotHoleData(data);
      print("Status " + status.toString());
      if (status) {
        _key.currentState.reset();
        toggle();
        // Navigator.of(context).popUntil();
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

  String selectedPotholesTypeValue;
  String selectedWardValue;
  String selectedRoadNameValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City Manager : Pot Holes Report"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Form(
          key: _key,
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextFormField(
                  validator: (s) {
                    if (s == null) return "Please Enter Road Name";
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Road Name",
                  ),
                  initialValue: selectedRoadNameValue,
                  enableInteractiveSelection: true,
                  onSaved: (selected) {
                    data["road_name"] = selected;
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextFormField(
                  validator: (s) {
                    if (s == null) return "Please Enter Ward Number";
                    return null;
                  },
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  decoration: InputDecoration(
                    labelText: "Enter Ward Number",
                  ),
                  initialValue: selectedWardValue,
                  enableInteractiveSelection: true,
                  onSaved: (selected) {
                    data["ward_number"] = selected;
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.5))),
                height: MediaQuery.of(context).size.height * 0.1,
                child: FormField<Map<String, dynamic>>(
                  validator: (s) {
                    if (s == null) return "Please Enter Location Address";

                    return null;
                  },
                  onSaved: (s) {
                    data["address"] = s["address"];
                    data["geotags"] = [
                      {
                        "latitude": s["latitude"],
                        "longitude": s["longiude"],
                      }
                    ];
                  },
                  builder: (FormFieldState<Map<String, dynamic>> state) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Location",
                          ),
                          controller: TextEditingController(text: selectedText),
                          enabled: false,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedText == null
                                ? Colors.black.withOpacity(0.5)
                                : Colors.black,
                          ),
                        ),
                        onTap: () async {
                          final p = await PlacesAutocomplete.show(
                            context: context,
                            apiKey: "AIzaSyD-bXnAW-uMa2qWIw4EVT_h-pkoJAx6Gx8",
                            components: [Component(Component.country, "in")],
                          ).catchError((onError) {
                            print(onError);
                            return;
                          });
                          setState(() {
                            selectedText = p?.description ?? null;
                          });

                          final geocoding = GoogleMapsPlaces(
                            apiKey: "AIzaSyD-bXnAW-uMa2qWIw4EVT_h-pkoJAx6Gx8",
                          );

                          PlacesDetailsResponse data = await geocoding
                              .getDetailsByPlaceId(p?.placeId)
                              .catchError((onError) {
                            print(onError);
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
