import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MainProvider extends ChangeNotifier {
  String baseUrl = "https://51.158.179.237/api";

  Future<bool> sendAccidentData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.Response res =
          await http.post('$baseUrl/accident-collect', body: data);
      if (res.statusCode != 200 && res.statusCode != 200)
        status = false;
      else
        status = true;
    } catch (e) {
      status = false;
    }
    return status;
  }

  Future<bool> sendNOCData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.Response res = await http.post('$baseUrl/noc-collect', body: data);
      if (res.statusCode != 200 && res.statusCode != 200)
        status = false;
      else
        status = true;
    } catch (e) {
      status = false;
    }
    return status;
  }

  Future<bool> sendEncrochmentData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.Response res =
          await http.post('$baseUrl/encroachment-collect', body: data);
      if (res.statusCode != 200 && res.statusCode != 200)
        status = false;
      else
        status = true;
    } catch (e) {
      status = false;
    }
    return status;
  }

  Future<bool> sendWaterLoggingData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.Response res =
          await http.post('$baseUrl/water-logging-collect', body: data);

      if (res.statusCode != 200 && res.statusCode != 200)
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
