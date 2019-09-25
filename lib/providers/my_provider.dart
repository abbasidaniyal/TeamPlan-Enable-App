import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MainProvider extends ChangeNotifier {
  String baseUrl =
      "https://cors-anywhere.herokuapp.com/http://51.158.179.237/api";

  Future<bool> sendAccidentData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.Response res = await http.post('$baseUrl/accident-notice',
          headers: {
            'Content-type': 'application/json',
            "Access-Control-Allow-Origin": "*",
          },
          body: json.encode(data));
      print(res.body);

      if (res.statusCode != 200 && res.statusCode != 201) {
        status = false;
      } else {
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
      http.Response res =
          await http.post('$baseUrl/noc-notice', body: json.encode(data));
      if (res.statusCode != 200 && res.statusCode != 201)
        status = false;
      else
        status = true;
    } catch (e) {
      status = false;
    }
    return status;
  }

  Future<bool> sendEncroachmentData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.Response res = await http.post('$baseUrl/encroachment-collect',
          body: json.encode(data));
      if (res.statusCode != 200 && res.statusCode != 201)
        status = false;
      else
        status = true;
    } catch (e) {
      status = false;
    }
    return status;
  }

  Future<bool> sendPotHoleData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.Response res = await http.post('$baseUrl/water-logging-collect',
          body: json.encode(data));

      if (res.statusCode != 200 && res.statusCode != 201)
        status = false;
      else
        status = true;
    } catch (e) {
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
