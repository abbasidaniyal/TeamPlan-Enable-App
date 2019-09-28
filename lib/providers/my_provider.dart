import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MainProvider extends ChangeNotifier {
  String baseUrl = "http://51.158.179.237/api";
  // String baseUrl ="https://cors-anywhere.herokuapp.com/http://51.158.179.237/api"; //For flutter web local
  String id;
  Future<bool> sendAccidentData(Map<String, dynamic> data) async {
    bool status = false;

    try {
      http.Response res = await http.post('$baseUrl/accident-notice',
          headers: {
            'Content-type': 'application/json',
          },
          body: json.encode(data));
      print(res.body);

      if (res.statusCode != 200 && res.statusCode != 201) {
        status = false;
      } else {
        id = "ACC" + json.decode(res.body)['id'].toString();
        status = true;
      }
    } catch (e) {
      print(e);
      status = false;
    }
    return status;
  }

  Future<bool> sendNOCData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.Response res = await http.post('$baseUrl/noc-notice',
          headers: {
            'Content-type': 'application/json',
          },
          body: json.encode(data));
      print(res.body);

      if (res.statusCode != 200 && res.statusCode != 201) {
        status = false;
      } else {
        id = "NOC" + json.decode(res.body)['id'].toString();
        status = true;
      }
    } catch (e) {
      print(e);
      status = false;
    }
    return status;
  }

  Future<bool> sendWaterLoggingData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.Response res = await http.post('$baseUrl/waterlogging-collect',
          headers: {
            'Content-type': 'application/json',
          },
          body: json.encode(data));
      print(res.body);

      if (res.statusCode != 200 && res.statusCode != 201) {
        status = false;
      } else {
        id = "WL" + json.decode(res.body)['id'].toString();
        status = true;
      }
    } catch (e) {
      print(e);
      status = false;
    }
    return status;
  }

  Future<bool> sendPotHoleData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.Response res = await http.post('$baseUrl/potholes-collect',
          headers: {
            'Content-type': 'application/json',
          },
          body: json.encode(data));
      print(res.body);

      if (res.statusCode != 200 && res.statusCode != 201) {
        status = false;
      } else {
        id = "PH" + json.decode(res.body)['id'].toString();
        status = true;
      }
    } catch (e) {
      print(e);
      status = false;
    }
    return status;
  }
  // Future<bool> sendTrafficLightData(Map<String, dynamic> data) async {
  //   bool status = false;
  //   try {
  //     http.post('$baseUrl/');
  //   } catch (e) {}
  //   return status;
  // }
  // Future<bool> sendStreetLightData(Map<String, dynamic> data) async {
  //   bool status = false;
  //   try {
  //     http.post('$baseUrl/');
  //   } catch (e) {}
  //   return status;
  // }
}
