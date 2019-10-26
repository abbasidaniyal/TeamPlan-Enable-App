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

class NOCFormPage extends StatefulWidget {
  @override
  _NOCFormPageState createState() => _NOCFormPageState();
}

class _NOCFormPageState extends State<NOCFormPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  Map<String, dynamic> data = {"geotags": []};
  bool isLoading = false;
  String selectedTextStart;
  String selectedTextEnd;
  List<String> selectedText = [];
  int count = -1;
  List<Map<String, String>> via = [];
  void submitForm() async {
    toggle();
    if (_key.currentState.validate()) {
      print(data);
      _key.currentState.save();
      MainProvider model = Provider.of(context);
      bool status = await model.sendNOCData(data);
      print("Status " + status.toString());
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

  String selectedNOCTypeValue;
  String selectedDistrictValue;
  String selectedNOCReasonValue;

  @override
  Widget build(BuildContext context) {
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
                  "Report NOC",
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
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                child: Container(
                  color: Colors.white,
                  child: DropdownButtonFormField<String>(
                    validator: (s) {
                      if (s == null) return "Please Select Reason of NOC";
                      return null;
                    },
                    decoration:
                        InputDecoration(labelText: "Choose Reason of NOC"),
                    value: selectedNOCTypeValue,
                    onChanged: (s) {
                      setState(() {
                        selectedNOCTypeValue = s;
                      });
                    },
                    items: typeOfNOC.map<DropdownMenuItem<String>>((typeNOC) {
                      return DropdownMenuItem<String>(
                        child: Text(
                          typeNOC,
                        ),
                        value: typeNOC,
                      );
                    }).toList(),
                    onSaved: (selected) {
                      data["reason_of_noc"] = selected;
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    validator: (s) {
                      if (s == null) return "Please Enter Type of NOC";
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Enter Type of NOC",
                    ),
                    initialValue: selectedNOCReasonValue,
                    enableInteractiveSelection: true,
                    onSaved: (selected) {
                      data["type_of_noc"] = selected;
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                child: Container(
                  color: Colors.white,
                  child: DateTimePickerFormField(
                    format: DateFormat("dd/MM/yyy hh:mm:ss"),
                    onSaved: (s) {
                      data["date_time"] = s.toIso8601String();
                    },
                    inputType: InputType.both,
                    style: TextStyle(
                      height: 2,
                    ),
                    editable: false,
                    validator: (d) {
                      if (d == null) {
                        return "Date Time Invalid";
                      }
                      if (d.isBefore(DateTime.now()))
                        return "Date is Already Gone";
                      return null;
                    },
                    resetIcon: null,
                    decoration: InputDecoration(
                        labelText: "Start Date and Time",
                        hasFloatingPlaceholder: true),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                child: Container(
                  color: Colors.white,
                  child: DateTimePickerFormField(
                    format: DateFormat("dd/MM/yyy hh:mm:ss"),
                    inputType: InputType.both,
                    onSaved: (s) {
                      data["date_time"] = s.toIso8601String();
                    },
                    style: TextStyle(
                      height: 2,
                    ),
                    editable: false,
                    validator: (d) {
                      if (d == null) {
                        return "Date Time Invalid";
                      }
                      if (d.isBefore(DateTime.now()))
                        return "Date is Already Gone";
                      return null;
                    },
                    resetIcon: null,
                    decoration: InputDecoration(
                        labelText: "End Date and Time",
                        hasFloatingPlaceholder: true),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Container(
                  color: Colors.white,
                  child: FormField<Map<String, dynamic>>(
                    validator: (s) {
                      if (s == null)
                        return "Please Enter Start Location Address";

                      return null;
                    },
                    onSaved: (s) {
                      // data["address"] = s["address"];
                      data["start_location_geotag"] = {
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
                              labelText: "Start Location",
                            ),
                            controller:
                                TextEditingController(text: selectedTextStart),
                            enabled: false,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedTextStart == null
                                  ? Colors.black.withOpacity(0.5)
                                  : Colors.black,
                            ),
                          ),
                          onTap: () async {
                            final p = await PlacesAutocomplete.show(
                              context: context,
                              apiKey: apiKey,
                              components: [Component(Component.country, "in")],
                            ).catchError((onError) {
                              print(onError);
                              return;
                            });
                            setState(() {
                              selectedTextStart = p?.description ?? null;
                            });

                            final geocoding = GoogleMapsPlaces(
                              apiKey: apiKey,
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
              ),
              count >= 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      addAutomaticKeepAlives: true,
                      itemCount: count + 1,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10.0),
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Container(
                            child: FormField<Map<String, dynamic>>(
                              validator: (s) {
                                if (s == null)
                                  return "Please Enter Via Location Address";

                                return null;
                              },
                              onSaved: (s) {
                                data["geotags"].insert(
                                  index,
                                  {
                                    "latitude": s["latitude"],
                                    "longitude": s["longiude"],
                                  },
                                );
                              },
                              builder:
                                  (FormFieldState<Map<String, dynamic>> state) {
                                return Container(
                                  color: Colors.white,
                                  width: MediaQuery.of(context).size.width,
                                  child: InkWell(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: "Via",
                                      ),
                                      controller: TextEditingController(
                                          text: selectedText[index]),
                                      enabled: false,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: selectedText[index] == null
                                            ? Colors.black.withOpacity(0.5)
                                            : Colors.black,
                                      ),
                                    ),
                                    onTap: () async {
                                      final p = await PlacesAutocomplete.show(
                                        context: context,
                                        apiKey: apiKey,
                                        components: [
                                          Component(Component.country, "in")
                                        ],
                                      ).catchError((onError) {
                                        print(onError);
                                        return;
                                      });
                                      setState(() {
                                        selectedText[index] =
                                            p?.description ?? null;
                                      });

                                      final geocoding = GoogleMapsPlaces(
                                        apiKey: apiKey,
                                      );

                                      PlacesDetailsResponse data =
                                          await geocoding
                                              .getDetailsByPlaceId(p?.placeId)
                                              .catchError((onError) {
                                        print(onError);
                                        return;
                                      });
                                      Map<String, dynamic> addressData = {
                                        "address": p?.description,
                                        "longiude": data
                                            ?.result?.geometry?.location?.lng,
                                        "latitude": data
                                            ?.result?.geometry?.location?.lat,
                                      };

                                      state.didChange(addressData);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    )
                  : Container(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Container(
                  child: FormField<Map<String, dynamic>>(
                    validator: (s) {
                      if (s == null) return "Please Enter End Location Address";

                      return null;
                    },
                    onSaved: (s) {
                      // data["address"] = s["address"];
                      data["end_location_geotag"] = {
                        "latitude": s["latitude"],
                        "longitude": s["longiude"],
                      };
                    },
                    builder: (FormFieldState<Map<String, dynamic>> state) {
                      return Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: InkWell(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "End Location",
                            ),
                            controller:
                                TextEditingController(text: selectedTextEnd),
                            enabled: false,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedTextEnd == null
                                  ? Colors.black.withOpacity(0.5)
                                  : Colors.black,
                            ),
                          ),
                          onTap: () async {
                            final p = await PlacesAutocomplete.show(
                              context: context,
                              apiKey: apiKey,
                              components: [Component(Component.country, "in")],
                            ).catchError((onError) {
                              print(onError);
                              return;
                            });
                            setState(() {
                              selectedTextEnd = p?.description ?? null;
                            });

                            final geocoding = GoogleMapsPlaces(
                              apiKey: apiKey,
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
              ),
              Container(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  child: Text(
                    "Add More",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedText.add(null);
                      count++;
                    });
                    print(count);
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                width: MediaQuery.of(context).size.width * 0.50,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                  color: Colors.grey,
                  child:
                      isLoading ? CircularProgressIndicator() : Text("Submit"),
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
