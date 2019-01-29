import 'dart:async';
import 'package:http/http.dart' as http;

class ApiClient {
  static final _client = ApiClient._internal();
  final String baseUrl = 'https://randomuser.me';

  ApiClient._internal();

  factory ApiClient() => _client;

  Future<http.Response> getTeasList() async {
    var url = '$baseUrl/api/?results=25';
    var response = await http.get(url);
    return response;
  }
}
