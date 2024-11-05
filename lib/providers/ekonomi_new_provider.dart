import 'dart:convert';

import 'package:cnew_app/models/ekonomi_new_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EkonomiNewProvider with ChangeNotifier {
  List<EkonomiNewModel> _ekonomiList = [];
  bool _isLoading = false;

  List<EkonomiNewModel> get ekonomiList => _ekonomiList;
  bool get isLoading => _isLoading;

  Future<void> fetchEkonomiNews() async {
    _isLoading = true;
    notifyListeners();

    final url =
        Uri.parse('https://api-berita-indonesia.vercel.app/antara/ekonomi/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        _ekonomiList = [EkonomiNewModel.fromJson(data)];
      }
    } catch (error) {
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
  }
}
