import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/Model_File.dart';

class ServiceFile {
  static const String _apiKey = 'you_own_api';
  static const String _apiUrl = 'https://api.openai.com/v1/chat/completions';

  Future<ModelFile?> sendMessage(List<ModelFile> messages) async {
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages.map((msg) => msg.toJson()).toList(),
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final reply = data['choices'][0]['message'];
        return ModelFile.fromJson(reply);
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
