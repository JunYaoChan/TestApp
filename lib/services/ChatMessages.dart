class ChatMessages{

  ///This is our chat message class. It holds information for each message, the sender, the receiver,
  ///the timestamp, and the message content.

  late final String idFrom; // From id
  late final String idTo; // To id
  late final String timestamp; // Timestamp
  late final String content; // Content of message
  late final String type; // Type of message (text, image, video, audio, etc)
  late final String status; // Status of message (sent, delivered, etc)

  ChatMessages(
      {
        required this.idFrom,
        required this.idTo,
        required this.timestamp,
        required this.content,
        required this.type,
        required this.status}
      );

  ChatMessages.fromApp(String message){
    ///This is the constructor for the chat message class when the user is messaging the built in chat, for example when creating account

    idFrom = 'Assistant'; // Set the sender to the built in chat
    idTo = 'User'; // Set the receiver to the user
    timestamp = DateTime.now().toString(); // Set the timestamp as current time
    content = message; // Set the content of the message based on the input
    type = 'text'; // Set the type of the message to text
    status = 'Read'; // Set the status of the message to read
  }

  ChatMessages.toBot(String message){
    ///This is the constructor for the chat message class when the user is messaging the built in chat, for example when creating account

    idFrom = 'User'; // Set the sender to the user
    idTo = 'Assistant'; // Set the receiver to the built in chat
    timestamp = DateTime.now().toString(); // Set the timestamp as current time
    content = message; // Set the content of the message based on the input
    type = 'text'; // Set the type of the message to text
    status = 'Read'; // Set the status of the message to read
  }








}