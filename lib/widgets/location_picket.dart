import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_webservice/geocoding.dart';

class LocationPicker extends StatefulWidget {
  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  String selectedText;
  @override
  Widget build(BuildContext context) {
    return FormField<Map<String, dynamic>>(
      builder: (state) {
        return FlatButton(
          child: Text(selectedText == null ? "Location" : selectedText),
          onPressed: () async {
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
              "Address": p.description,
              "longiude": data.result.geometry.location.lng,
              "latitude": data.result.geometry.location.lat,
            };
            // state.didUpdateWidget(oldWidget);
          },
        );
      },
    );
  }
}
