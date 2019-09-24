import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class MainProvider extends ChangeNotifier {
  String baseUrl = "https://";

  Future<bool> sendAccidentData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.get('');
    } catch (e) {}
    return status;
  }
  Future<bool> sendNOCData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.get('');
    } catch (e) {}
    return status;
  }
  Future<bool> sendEncrochmentData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.get('');
    } catch (e) {}
    return status;
  }
  Future<bool> sendWaterLoggingData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.get('');
    } catch (e) {}
    return status;
  }
  Future<bool> sendTrafficLightData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.get('');
    } catch (e) {}
    return status;
  }
  Future<bool> sendStreetLightData(Map<String, dynamic> data) async {
    bool status = false;
    try {
      http.get('');
    } catch (e) {}
    return status;
  }
}
