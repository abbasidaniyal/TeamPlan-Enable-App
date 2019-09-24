import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class LocationPicker extends StatefulWidget {
  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      // height: 80,
      padding: EdgeInsets.symmetric(vertical: 30.0),
      width: MediaQuery.of(context).size.width,
      child: PlacesAutocompleteFormField(
        types: ["geocode"],
        mode: Mode.fullscreen,
        hint: "",
        inputDecoration: InputDecoration(
            labelText: "Location", labelStyle: TextStyle(fontSize: 24)),
        components: [Component(Component.country, "in")],
        validator: (d) {},
        apiKey: "AIzaSyD-bXnAW-uMa2qWIw4EVT_h-pkoJAx6Gx8",
        onSaved: (value) {
          print(value);
        },
      ),
    );
  }
}
