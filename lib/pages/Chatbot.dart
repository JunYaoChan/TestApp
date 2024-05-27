import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:test_project/Theme.dart';
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final List<String> data = [];
  final _user = const types.User(id: 'user_id');
  late DialogFlowtter _dialogFlowtter;
  final _bot = const types.User(id: 'bot');

  @override
  void initState() {
    super.initState();
    DialogFlowtter.fromFile(path: "assets/dialog_flow_auth.json")
        .then((instance) {
      _dialogFlowtter = instance;
      _sendInitialBotMessage();
    });
  }

  void _sendInitialBotMessage() {
    final botMessage = types.TextMessage(
      author: _bot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text:
          "Hi there! Welcome to Swerv! Let's get you set up. Can I start by getting your name?",
    );

    _addMessage(botMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _sendMessage(String text) async {
    if (text.isEmpty) return;

    final message = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: text,
    );
    _addMessage(message);

    final response = await _dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message != null && response.message!.text != null) {
      final botMessage = types.TextMessage(
        author: _bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: response.message!.text!.text![0],
      );

      _addMessage(botMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 102, 180),
      appBar: AppBar(
        backgroundColor: TestAppColour.primaryBlue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Swerv Chatbot',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Chat(
        theme: DefaultChatTheme(
          backgroundColor: TestAppColour.babyBlue,
          inputBackgroundColor: TestAppColour.primaryBlue,
        ),
        messages: _messages,
        onSendPressed: (message) {
          if (message is types.PartialText) {
            _sendMessage(message.text);
          }
        },
        user: _user,
      ),
    );
  }
}
