import 'package:flutter/material.dart';
import 'package:test_project/constants/DecorationConstants.dart';
import 'Theme.dart';

//ignore: must_be_immutable
class PortalCard extends StatefulWidget {

  ///The portal card widget is a Stateful widget that contains a username and password box.
  ///Depending on the card type (1 =Login, 2 = Sign up) it will display the appropriate
  ///text box, button and will direct the user to the correct page.


  bool passwordVisible; // Password visible or not
  final int cardType; // 1 = Login, 2 = Sign up

  final int login = 1;
  final int signup = 2;


  //PortalCard constructor method, takes the password visible and card type to construct the card
  PortalCard({Key? key,
    required bool this.passwordVisible,
    required int this.cardType,
  }) : super(key : key);


  @override
  State<PortalCard> createState() => _PortalCardState(); // Create the card state.
}

class _PortalCardState extends State<PortalCard> {


  Map<int, String> dict = {1:'Log in', 2:'Sign up'}; //Dictionary to display the correct text depending on card type.



  @override
  Widget build(BuildContext context) {
    ///Builds the card widget
    return Center(

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25), //Describes the shape of the card (rounded corners)
        ),
        color: TestAppColour.primaryBlue, //Sets the background color of the card


        //Card content
        child: Column(
          mainAxisSize: MainAxisSize.min, //Sets the main axis size of the card
          children: [

            const SizedBox(height: 35),


            //Username field title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('USERNAME',


                    //Sets the text style
                    style: TextStyle(
                    color: TestAppColour.primaryPurple, // Sets the text color
                    fontFamily: 'Poppins', // Sets the font
                    fontWeight: FontWeight.w500, // Sets the font weight
                    fontSize: 17 // Sets the font size
                    )
                ),
              ),
            ),


            const SizedBox(height: 3),


            //Username field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15), // Sets the padding of the text field
              child: TextField(

                // Sets the style of the text field
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15), // Sets the border radius of the text field

                      //Creates an invisible border that allows the text field to have rounded edges
                      borderSide: const BorderSide(
                        width: 0, // Sets the width of the border to 0 (no border)
                        style: BorderStyle.none, // Sets the border style to none
                      )
                  ),
                  filled: true, // Sets the field to be filled
                  fillColor: TestAppColour.primaryGreen.withOpacity(0.5), // Sets the background color of the field (if filled=true)

                  // Sets the style of the hint text
                  hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300
                  ),
                  hintText: 'Enter username', //Sets the hint text to 'Enter username'
                ),
              ),
            ),


            const SizedBox(height: 20),


            //Password field title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15), // Sets the padding of the text
              child: Align(
                alignment: Alignment.centerLeft, // Aligns the text to the left
                child: Text('PASSWORD', // Sets the text to 'Password'

                    //Sets the text style
                    style: TextStyle(
                        color: TestAppColour.primaryPurple, // Sets the text color
                        fontFamily: 'Poppins', // Sets the font
                        fontWeight: FontWeight.w500, // Sets the font weight
                        fontSize: 17 // Sets the font size
                    )
                ),
              ),
            ),


            const SizedBox(height: 2),

            //Password field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15), // Sets the padding of the text

              //Sets the style of the text field
              child: TextField(
                obscureText: widget.passwordVisible, // Hides the password if passwordVisible is true
                enableSuggestions: false, // Disables suggestions
                autocorrect: false, // Disables autocorrection

                //Sets the style of the text field
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15), // Sets the border radius of the text field

                      //Sets the border to be invisible
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )
                  ),

                  filled: true, // Sets the field to be filled with fillColor
                  fillColor: TestAppColour.primaryGreen.withOpacity(0.5), // Sets the background color of the field (if filled=true)

                  //Sets the style of the hint text
                  hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300
                  ),

                  //Sets the hint text to 'Enter password'
                  hintText: 'Enter password',

                  //Sets the suffix icon as a visibility icon which is clickable
                  suffixIcon: IconButton(
                    icon: Icon(widget.passwordVisible ? Icons.visibility : Icons.visibility_off), //If passwordVisible=true (ie the password is hidden),
                      // sets the icon to be a visibility icon (ie press to show password),
                      // else sets the icon to be a visibility off icon (ie press to hide password)

                    onPressed: (){
                      setState(() {
                        widget.passwordVisible = !widget.passwordVisible; //On pressed, set the state (rebuild) and toggle the password visibility
                    }
                    );
                    }),


                  ),
                  //suffixIconColor: TestAppColour.primaryPurple
                ),
              ),



            //Forgot password button
            Align(
              alignment: Alignment.centerRight, // Aligns the button to the right
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0), // Sets the padding of the button

                  //Text button for user to press if they have forgotten their password
                  child: TextButton(
                    onPressed: (){},
                    child: const Text('Forgot password?', // Sets the text to 'Forgot password?'
                      style: TextStyle(
                          color: TestAppColour.primaryPurple, // Sets the text color
                          fontFamily: 'Poppins' // Sets the font
                      ),
                    ),)
              ),
            ),


            SizedBox(height: 5),


            //Login/Signup button
            ElevatedButton(
                onPressed: () {
                  //On pressed call loginSignup()
                  loginSignup();
                },

                //Sets the button style
                style: ElevatedButton.styleFrom(
                    backgroundColor: TestAppColour.babyBlue.withOpacity(0.75), // Sets the background color
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10) // Sets the border radius
                    )
                ),

                //Button text
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 5, 30, 5), // Sets the padding of the button's text
                  child: Text(
                    dict[widget.cardType]!, // Sets the text to 'Login' or 'Sign up' depending on the card type

                    //Set the text style
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: TestAppColour.primaryPurple,
                    ),
                  ),
                )
            ),


            const SizedBox(height: 5),


            //New here text
            TextButton(
                onPressed: (){
                  //On pressed push the user to the signup screen
                  Navigator.pushReplacementNamed(context, '/signup');
                },

                //Sets the text and style
                child: const Text(
                  'New here?',
                  style: TextStyle(
                      fontFamily: 'Poppins', // Sets the font
                      fontWeight: FontWeight.w500, // Sets the font weight
                      fontSize: 20, // Sets the font size
                      color: TestAppColour.primaryPurple // Sets the text color
                  ),
                )
            ),


            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  void loginSignup () {
    ///This function will first check to see if the user has entered valid credentials.
    ///If so it will then request to login with Firebase.
    ///If credentials are correct it will log the user in and push the homescreen.
    //navigate user to home screen and clear back stack.

    if(widget.cardType == widget.signup) {
      //If card type is signup, navigate to create account
      Navigator.pushNamedAndRemoveUntil(context, '/createAccount', (route) => false);

    } else if (widget.cardType == widget.login){
      //Else if card type is login, navigate to signin
      Navigator.pushNamedAndRemoveUntil(context, '/siginin', (route) => false);
    }

  }



}
