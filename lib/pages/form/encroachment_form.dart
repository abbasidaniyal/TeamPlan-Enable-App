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

class EncroachmentFormPage extends StatefulWidget {
  @override
  _EncroachmentFormPageState createState() => _EncroachmentFormPageState();
}

class _EncroachmentFormPageState extends State<EncroachmentFormPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  Map<String, dynamic> data = {};
  bool isLoading = false;
  String selectedText;

   void submitForm() async {
    toggle();
    if (_key.currentState.validate()) {
      _key.currentState.save();
      MainProvider model = Provider.of(context);
      bool status = await model.sendEncroachmentData(data);
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

  String selectedEncroachmentTypeValue;
  String selectedDistrictValue;
  String selectedEncroachmentReasonValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Police : Encroachment Report"),
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
                    if (s == null) return "Please Select Type of Encroachment";
                    return null;
                  },
                  decoration:
                      InputDecoration(labelText: "Choose Type of Encroachment"),
                  value: selectedEncroachmentTypeValue,
                  onChanged: (s) {
                    setState(() {
                      selectedEncroachmentTypeValue = s;
                    });
                  },
                  items: typeOfEncroachment
                      .map<DropdownMenuItem<String>>((EncroachmentType) {
                    return DropdownMenuItem<String>(
                      child: Text(
                        EncroachmentType,
                      ),
                      value: EncroachmentType,
                    );
                  }).toList(),
                  onSaved: (selected) {
                    data["type_of_Encroachment"] = selected;
                  },
                ),
              ),
              Container(
                child: DropdownButtonFormField<String>(
                  validator: (s) {
                    if (s == null) return "Please Select Reason of Encroachment";
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Choose Reason of Encroachment",
                  ),
                  value: selectedEncroachmentReasonValue,
                  onChanged: (s) {
                    setState(() {
                      selectedEncroachmentReasonValue = s;
                    });
                  },
                  items: reasonOfEncroachment
                      .map<DropdownMenuItem<String>>((EncroachmentReason) {
                    return DropdownMenuItem<String>(
                      child: Text(
                        EncroachmentReason,
                      ),
                      value: EncroachmentReason,
                    );
                  }).toList(),
                  onSaved: (selected) {
                    data["reason_of_Encroachment"] = selected;
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
                    if (d == null) {
                      return "Date Time Invalid";
                    }
                    if (d.isAfter(DateTime.now())) return "Date is in Future";
                    return null;
                  },
                  resetIcon: null,
                  decoration: InputDecoration(
                      labelText: "Date and Time of Encroachment",
                      hasFloatingPlaceholder: true),
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
                    data["geocode"] = [
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
