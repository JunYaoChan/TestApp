import 'package:test_project/services/ChatMessages.dart';


class ChatProvider{

}

class AutoChatProvider{

  late List<ChatMessages> chatMessageHistory = []; //This will hold all the previous chat messages that have been sent and recieved from the bot

  late Map<String, String> userInfoMap = {}; // This will hold the information of the user



  Stream<List<ChatMessages>> getChatMessages() {
    if (chatMessageHistory.isEmpty & accountCreated() == false){
      chatMessageHistory.add(ChatMessages.fromApp('Welcome to XXX, we\'re excited to have you! Firstly, what is your name?'));
      return Stream.value(chatMessageHistory);
    } else {
      return Stream.value(chatMessageHistory);
    }
  }

  bool accountCreated() {
    return false;
  }

  void sendChatMessage(ChatMessages message) {
    chatMessageHistory.add(message);
  }


}