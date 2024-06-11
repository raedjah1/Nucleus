import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://pim-api.swat3.qcell.gm/api/v1';

  static Future<List<Map<String, dynamic>>> fetchStaffData() async {
    final url = Uri.parse('$baseUrl/staff');
    final response = await http.get(url);

    print('API Response Status Code: ${response.statusCode}'); // Log status code
    print('API Response Body: ${response.body}'); // Log response body

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((data) => data as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load staff data');
    }
  }
}
