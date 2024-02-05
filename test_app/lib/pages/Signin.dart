import 'package:flutter/material.dart';
import 'package:test_project/PortalCard.dart';
import 'package:test_project/Theme.dart';

class Signin extends StatelessWidget {

  ///Sign in screen class.

  const Signin({super.key});

  final double pi = 3.14;

  @override
  Widget build(BuildContext context) {
    // Build the sign in screen with the portal card
    return Scaffold(
      body: Stack(
        children: [

          //App logo in the background
          Transform.translate(
            offset: const Offset(-140, 0),
            child: Transform.rotate(
              angle: -pi/20,
                child: const Image(image: AssetImage('assets/app_logo_300_300.png'))),
          ),

          //Second app logo in the background
          Transform.translate(
            offset: Offset(200, 500),
            child: Transform.rotate(
                angle: pi/4,
                child: const Image(image: AssetImage('assets/app_logo_300_300.png'))),
          ),

          //Main card widget
          Center(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //Card title
                const Text('Login',
                  style: TextStyle(
                    color: TestAppColour.primaryPurple,
                    fontSize: 60.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500
                  ),
                ),

                //Card sub title
                const Text('Sign in to continue',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  color: TestAppColour.primaryPink
                )
                ),

                const SizedBox(height: 25),

                //Portal card with the card type=1 (login card)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PortalCard(passwordVisible: false, cardType: 1)
                ),
              ],
            ),
          ),
        ]
        ),
      );
  }

}






