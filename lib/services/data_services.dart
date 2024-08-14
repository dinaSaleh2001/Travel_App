import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travelapp/model/data_model.dart';

class DataServices {
  var apiUrl = "http://mark.bslmeiyu.com/api/getplaces";
  Future<List<DataModel>> getInfo() async {
    http.Response res = await http.get(Uri.parse(apiUrl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = jsonDecode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      return <DataModel>[];
    }
  }
}

class PlacesProvider with ChangeNotifier {
  List<dynamic> _places = [];
  bool _isLoading = false;

  List<dynamic> get places => _places;
  bool get isLoading => _isLoading;

  Future<void> fetchPlaces(String name) async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('http://mark.bslmeiyu.com/api/getplaces?name=$name');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        _places = json.decode(response.body);
      } else {
        _places = [];
        throw Exception('Failed to load places');
      }
    } catch (e) {
      _places = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
