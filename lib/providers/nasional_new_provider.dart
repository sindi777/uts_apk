import 'dart:convert';

import 'package:cnew_app/models/nasional_new_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NasionalNewProvider with ChangeNotifier {
  List<NasionalNewModel> _nasionalList = [];
  bool _isLoading = false;

  List<NasionalNewModel> get nasionalList => _nasionalList;
  bool get isLoading => _isLoading;

  Future<void> fetchNasionalNews() async {
    _isLoading = true;
    notifyListeners();

    final url =
        Uri.parse('https://api-berita-indonesia.vercel.app/cnn/nasional/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        _nasionalList = [NasionalNewModel.fromJson(data)];
      }
    } catch (error) {
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
  }
}
