import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainProvider extends ChangeNotifier {
  static const String baseUrl = String.fromEnvironment("BASE_URL");
  String apiKey = String.fromEnvironment("GOOGLE_API_KEY");
  String authToken;

  Future<bool> login(String username, String password) async {
    bool status = false;
    try {
      http.Response res = await http.post("$baseUrl/api/login",
          headers: {"content-type": "application/json", 'accept': '*/*'},
          body: json.encode({
            "username": username,
            "password": password,
          }));

      if (res.statusCode != 200 && res.statusCode != 201) return false;

      authToken = res.headers["authorization"];

      status = true;
    } catch (e) {}

    return status;
  }

  String id;
  Future<bool> sendAccidentData(Map<String, dynamic> data) async {
    bool status = false;

    try {
      http.Response res = await http.post('$baseUrl/api/accidents',
          headers: {
            "Content-Type": 'application/json',
            'Authorization': authToken,
            'accept': '*/*',
          },
          body: json.encode(data));

      if (res.statusCode != 200 && res.statusCode != 201) {
        status = false;
      } else {
        id = "ACC" + json.decode(res.body)['id'].toString();
        status = true;
      }
    } catch (e) {
      status = false;
    }
    return status;
  }

  Future<bool> sendNOCData(Map<String, dynamic> data) async {
    bool status = false;

    try {
      http.Response res = await http.post('$baseUrl/api/nocs',
          headers: {
            "Content-Type": 'application/json',
            'Authorization': authToken,
            'accept': '*/*',
          },
          body: json.encode(data));

      if (res.statusCode != 200 && res.statusCode != 201) {
        status = false;
      } else {
        id = "NOC" + json.decode(res.body)['id'].toString();
        status = true;
      }
    } catch (e) {
      status = false;
    }
    return status;
  }

  Future<bool> sendWaterLoggingData(Map<String, dynamic> data) async {
    bool status = false;

    try {
      http.Response res = await http.post('$baseUrl/api/waterloggings',
          headers: {
            "Content-Type": 'application/json',
            'Authorization': authToken,
            'accept': '*/*',
          },
          body: json.encode(data));

      if (res.statusCode != 200 && res.statusCode != 201) {
        status = false;
      } else {
        id = "WL" + json.decode(res.body)['id'].toString();
        status = true;
      }
    } catch (e) {
      status = false;
    }
    return status;
  }

  Future<bool> sendPotHoleData(Map<String, dynamic> data) async {
    bool status = false;

    try {
      http.Response res = await http.post('$baseUrl/api/potholes',
          headers: {
            "Content-Type": 'application/json',
            'Authorization': authToken,
            'accept': '*/*',
          },
          body: json.encode(data));

      if (res.statusCode != 200 && res.statusCode != 201) {
        status = false;
      } else {
        id = "PH" + json.decode(res.body)['id'].toString();
        status = true;
      }
    } catch (e) {
      status = false;
    }
    return status;
  }

  Future<bool> sendEnchroachmentData(Map<String, dynamic> data) async {
    bool status = false;

    try {
      http.Response res = await http.post('$baseUrl/api/encroachments',
          headers: {
            "Content-Type": 'application/json',
            'Authorization': authToken,
            'accept': '*/*',
          },
          body: json.encode(data));

      if (res.statusCode != 200 && res.statusCode != 201) {
        status = false;
      } else {
        id = "EN" + json.decode(res.body)['id'].toString();
        status = true;
      }
    } catch (e) {
      status = false;
    }
    return status;
  }
}
