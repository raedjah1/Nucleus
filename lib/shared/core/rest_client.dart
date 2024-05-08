import 'dart:convert';

import 'package:nucleus/shared/core/exception.dart';
import 'package:nucleus/shared/core/local_storage.dart';
import 'package:http/http.dart' as http;

class RestClient {
  final _baseUrl = 'https://api.example.com';

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Connection': 'keep-alive'
  };

  final LocalStorage _localStorage;

  RestClient(this._localStorage);

  void setToken() {
    final token = _localStorage.read('token');
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
  }

  Future<T> get<T>(String path) async {
    setToken();
    // Make a GET request
    final result = await http.Client().get(
      Uri.parse('$_baseUrl/$path'),
      headers: headers,
    );
    if (result.statusCode != 200) {
      final message = json.decode(result.body)['message'];
      throw ApiException(message, 500);
    }

    return json.decode(result.body);
  }

  Future<T> post<T>(String path, Map<String, dynamic> body) async {
    setToken();
    // Make a POST request
    final result = await http.Client().post(
      Uri.parse('$_baseUrl/$path'),
      headers: headers,
      body: json.encode(body),
    );
    if (result.statusCode != 200 || result.statusCode != 201) {
      final message = json.decode(result.body)['message'];
      throw ApiException(message, 500);
    }

    return json.decode(result.body);
  }

  Future<T> patch<T>(String path, Map<String, dynamic> body) async {
    setToken();
    // Make a PUT request
    final result = await http.Client().patch(
      Uri.parse('$_baseUrl/$path'),
      headers: headers,
      body: json.encode(body),
    );
    if (result.statusCode != 200) {
      final message = json.decode(result.body)['message'];
      throw ApiException(message, 500);
    }

    return json.decode(result.body);
  }

  Future<T> delete<T>(String path) async {
    setToken();
    // Make a DELETE request
    final result = await http.Client().delete(
      Uri.parse('$_baseUrl/$path'),
      headers: headers,
    );
    if (result.statusCode != 200) {
      final message = json.decode(result.body)['message'];
      throw ApiException(message, 500);
    }

    return json.decode(result.body);
  }
}
