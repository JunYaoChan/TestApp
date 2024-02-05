
import 'package:flutter/cupertino.dart';
import 'package:test_project/services/chatbot/ChatBotConfig.dart';

class ChatBot extends StatefulWidget {

  final ChatBotConfig config;

  const ChatBot(this.config, {super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
