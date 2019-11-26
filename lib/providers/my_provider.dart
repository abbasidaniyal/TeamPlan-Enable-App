import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';

class MainProvider extends ChangeNotifier {
  // var http = Dio();

  // String baseUrl = "https://cors-anywhere.herokuapp.com/http://51.158.68.161/staging"; //For flutter web local
  String baseUrl = "http://51.158.68.161/staging";
  String authToken;

  Future<bool> login(String username, String password) async {
    print("Reaching");
    bool status = false;
    try {
      http.Response res = await http.post("$baseUrl/api/login",
          headers: {"content-type": "application/json", 'accept': '*/*'},
          body: json.encode({
            "username": username,
            "password": password,
          }));

      // print(res.toString());

      // print("STATUS CODE " + res.statusCode.toString());
      print("BODY " + res.headers.toString());

      if (res.statusCode != 200 && res.statusCode != 201) return false;

      // print("DEBUG 1");
      // print(res.headers["authorization"]);
      authToken = res.headers["authorization"];
      
      // print(authToken);
      // print("DEBUG 2");
      status = true;
    } catch (e) {
      print(e);
    }

    return status;
  }

  String id;
  Future<bool> sendAccidentData(Map<String, dynamic> data) async {
    bool status = false;
    // print("Dummy : " + isDummy.toString());
    // if (isDummy) {
    //   id = "ACC00XX";
    //   return true;
    // }

    try {
      http.Response res = await http.post('$baseUrl/api/accidents',
          headers: {
            "Content-Type": 'application/json',
            'Authorization': authToken,
            'accept': '*/*',
          },
          body: json.encode(data));
      // print(res.body);
      // print(res.headers);

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
    // if (isDummy) {
    //   id = "NOC00XX";
    //   return true;
    // }
    try {
      http.Response res = await http.post('$baseUrl/api/nocs',
          headers: {
            "Content-Type": 'application/json',
            'Authorization': authToken,
            'accept': '*/*',
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
    // if (isDummy) {
    //   id = "WL00XX";
    //   return true;
    // }
    try {
      http.Response res = await http.post('$baseUrl/api/waterloggings',
          headers: {
            "Content-Type": 'application/json',
            'Authorization': authToken,
            'accept': '*/*',
          },
          body: json.encode(data));
      // print(res.body);

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
    // if (isDummy) {
    //   id = "PH00XX";
    //   return true;
    // }
    try {
      http.Response res = await http.post('$baseUrl/api/potholes',
          headers: {
            "Content-Type": 'application/json',
            'Authorization': authToken,
            'accept': '*/*',
          },
          body: json.encode(data));
      // print(res.body);

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

  Future<bool> sendEnchroachmentData(Map<String, dynamic> data) async {
    bool status = false;
    // if (isDummy) {
    //   id = "PH00XX";
    //   return true;
    // }
    try {
      http.Response res = await http.post('$baseUrl/api/encroachments',
          headers: {
            "Content-Type": 'application/json',
            'Authorization': authToken,
            'accept': '*/*',
          },
          body: json.encode(data));
      // print(res.body);

      if (res.statusCode != 200 && res.statusCode != 201) {
        status = false;
      } else {
        id = "EN" + json.decode(res.body)['id'].toString();
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
