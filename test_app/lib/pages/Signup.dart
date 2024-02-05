import 'package:flutter/material.dart';
import 'package:test_project/PortalCard.dart';

import '../Theme.dart';

class Signup extends StatelessWidget {

  /// This is the signup screen, where users can create an account.

  const Signup({super.key});

  final double pi = 3.14;

  @override
  Widget build(BuildContext context) {

    //Build the signup screen
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


            Center(
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //Card title
                  const Text('Sign up',
                    style: TextStyle(
                        color: TestAppColour.primaryPurple,
                        fontSize: 60.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500
                    ),
                  ),

                  //Card subtitle
                  const Text('Sign up and create an account',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          color: TestAppColour.primaryPink
                      )
                  ),


                  const SizedBox(height: 25),

                  //Card widget with card type=2 (signup card)
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: PortalCard(passwordVisible: false, cardType: 2),
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
}

