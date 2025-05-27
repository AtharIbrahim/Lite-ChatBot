import 'package:flutter/cupertino.dart';
import 'package:lite_chatbot/Services/Services_File.dart';

import '../Model/Model_File.dart';

class ProviderFile with ChangeNotifier{
  final List<ModelFile> _messages = [];
  final ServiceFile _chatService = ServiceFile();

  List<ModelFile> get messages => _messages;

  Future<void> sendMessage(String content) async {
    final userMessage = ModelFile(role: 'user', content: content);
    _messages.add(userMessage);
    notifyListeners();

    final botResponse = await _chatService.sendMessage(_messages);
    if (botResponse != null) {
      _messages.add(botResponse);
      notifyListeners();
    }
  }
}