import 'package:flutter/cupertino.dart';
import 'package:lite_chatbot/Services/Services_File.dart';
import '../Model/Model_File.dart';

class ProviderFile with ChangeNotifier {
  final List<ModelFile> _messages = [];
  final ServiceFile _chatService = ServiceFile();

  bool _isLoading = false;

  List<ModelFile> get messages => List.unmodifiable(_messages);
  bool get isLoading => _isLoading;

  Future<void> sendMessage(String content) async {
    final userMessage = ModelFile(role: 'user', content: content);
    _messages.add(userMessage);
    notifyListeners();

    _isLoading = true;
    notifyListeners();

    try {
      final botResponse = await _chatService.sendMessage(_messages);
      if (botResponse != null) {
        _messages.add(botResponse);
      }
    } catch (e) {
      // Optionally, you can add an error message bubble here
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearChat() {
    _messages.clear();
    notifyListeners();
  }
}