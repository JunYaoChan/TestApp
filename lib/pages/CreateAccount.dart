import 'package:flutter/material.dart';

import 'package:test_project/Theme.dart';
import 'package:test_project/constants/DecorationConstants.dart';
import 'package:test_project/services/ChatMessages.dart';
import 'package:test_project/widgets/ChatBubble.dart';

class CreateAccount extends StatefulWidget {

  /// This is the create account screen, where users can create an account.
  /// It will function like a chat bot and will ask users a series of questions to create an account.


  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  List<String> questions = ["What is your name?",
    "Choose a username, or enter your own:"]; // List of questions that the bot will ask the user

  List<String> userResponses = []; // List of user responses
  List<String> botResponses = []; // List of the bot's responses to keep track of the conversation

  late String currentQuestion; // The current question that the bot is asking the user


  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {

    super.initState();
    print('Init state');
    showNextQuestion();
  }

  void showNextQuestion() {
    if (questions.isEmpty){
      print('No more questions');
    }
    setState(() {
      print('setting state');
      currentQuestion = questions.removeAt(0);
      print(currentQuestion);
      botResponses.add(currentQuestion);
      print(botResponses);
    });
  }

  void saveUserResponse(String response) {
    print('Saving response: $response');
    setState(() {
      userResponses.add(response);
    });
    showNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: getMaterialColor(TestAppColour.babyBlue)[50],
      //Set the background color to light blue

      //Create an app bar at the top of the screen
      appBar: AppBar(
        centerTitle: true,
        // Centers the title
        title: const Text(
            'Create Account', //Set the title to 'Create Account
            style: TextStyle(
              color: TestAppColour.primaryPurple, //Set the text color to purple
              fontFamily: 'Poppins', //Set the font
              fontWeight: FontWeight.w500, //Set the font weight
              fontSize: 23, //Set the font size
            )
        ),

        backgroundColor: TestAppColour.babyBlue,

        //Create action button at the top of the screen
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            //Set the icon to a settings button
            color: TestAppColour.primaryPurple, //Set the icon color to purple
          )
        ],

        iconTheme: const IconThemeData(
          color: TestAppColour
              .primaryPurple, //Set the icon color of back button to purple
        ),
      ),

      //Build the body of the screen
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15), //Sets the padding of the screen
            child: Column(
              children: [
                buildListMessages(), //The messages area
                const SizedBox(height: 10),
                buildMessageInput(), // The message input area
              ],
            ),
          )
      ),
    );
  }

  Widget buildListMessages() {
    print('Building list messages');
    return Expanded(
        child: ListView.builder(
          itemCount: userResponses.length + botResponses.length,
          itemBuilder: (context, index) {
            print('length: ${userResponses.length + botResponses.length}');

            if (index == 0) {
              print('First index: $index');
              return textBubbles(index, ChatMessages.fromApp(botResponses[0]));


            } else if (index % 2 == 0) {
              print('Even index: $index');

              int userIndex = index ~/ 2;

              return textBubbles(
                  index, ChatMessages.fromApp(botResponses[userIndex]));
            } else {
              print('Odd index: $index');
              //Returns a text bubble for each message

              int botIndex = (index - 1) ~/ 2;

              return textBubbles(index, ChatMessages.toBot(userResponses[botIndex]));
            }
            },
        )
      );
    }

  Widget buildMessageInput() {
    return SizedBox(
      width: double.infinity,
      //Sets the width of the messages area to the width of the screen
      height: 60,
      //Sets the height of the messages area to 50
      child: Container(
        decoration: BoxDecoration(
          border: outlinedBoxBorder,
          color: TestAppColour.primaryGreen, //Sets the background color of the messages area
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          )
        ),
        padding: const EdgeInsets.all(10),
        
        
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: TextField(
                    controller: _textEditingController,
                    textInputAction: TextInputAction.send,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: cBlankTextInputDecoration,
                    onSubmitted: (value) {
                      saveUserResponse(value);
                      _textEditingController.clear();
                    },
                  )
              ),
              IconButton(
                  onPressed: (){
                    saveUserResponse(_textEditingController.text);
                    _textEditingController.clear();
                  },
                  icon: const Icon(Icons.send)),
            ]
        ),
      ),
    );
  }

  Widget textBubbles(int index, ChatMessages chatMessage){
    ///This is a text bubble, it takes the message index and the message as input.
    ///It returns a widget based on the message type

    //If the message is from the user, return a pink text bubble aligned to the right
    if (chatMessage.idFrom == 'User'){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          messageBubble(message: chatMessage.content, color: TestAppColour.primaryPink,textColor: Colors.white , margin: const EdgeInsets.all(10)),
        ]
      );


    //If the message is from the assistant, return a blue text bubble aligned to the left
    } else if (chatMessage.idFrom == 'Assistant'){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              messageBubble(message: chatMessage.content, color: TestAppColour.primaryBlue, textColor: Colors.white, margin: const EdgeInsets.all(10)),
            ],
          ),
        ]
      );


    //If the message is of an invalid type, throw an exception
    } else{
      throw Exception('Invalid message type');
    }
  }

}
