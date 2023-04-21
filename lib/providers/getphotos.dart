import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/photo.dart';
import 'package:http/http.dart' as http;

class PhotodProvider extends ChangeNotifier {
  List<dynamic> _photos = [];
  List<dynamic> get photos => _photos;

  Future<void> fetchPhotos() async {
    final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/curated/?page=1&per_page=15'),
      headers: {
        'Authorization':
            'b3WwMrMkCQsgW9JBZ5NENB65tJqxAECGtXTqICybIjTUm7FiTo3PkmhC'
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _photos = data['photos'];
      notifyListeners();
    } else {
      throw Exception('Failed to fetch photos');
    }
  }
}
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart';

// class PexelsProvider extends ChangeNotifier {
//   final String _baseUrl = 'https://api.pexels.com/v1/curated';
//   final String _apiKey = 'b3WwMrMkCQsgW9JBZ5NENB65tJqxAECGtXTqICybIjTUm7FiTo3PkmhC';

//   List<dynamic> _photos = [];
//   List<dynamic> get photos => _photos;

//   Future<void> fetchPhotos() async {
//     final response = await http.get(
//       Uri.parse('$_baseUrl?page=1&per_page=15'),
//       headers: {'Authorization': _apiKey},
//     );
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       _photos = data['photos'];
//       notifyListeners();
//     } else {
//       throw Exception('Failed to fetch photos');
//     }
//   }
