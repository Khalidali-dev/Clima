import 'dart:developer';

import 'package:http/http.dart' as http;

class HttpAPIService {
  Future<http.Response> getAPI(String url) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      log("GET response: ${response.body}");
      return response;
    } catch (e) {
      log("GET request error: $e");
      rethrow;
    }
  }
}
