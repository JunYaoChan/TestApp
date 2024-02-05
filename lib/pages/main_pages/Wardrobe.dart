import 'package:flutter/material.dart';

import '../../Theme.dart';

class Wardrobe extends StatefulWidget {
  const Wardrobe({super.key});

  @override
  State<Wardrobe> createState() => _WardrobeState();
}

class _WardrobeState extends State<Wardrobe> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
            'Your Wardrobe',
            style: TextStyle(
              color: TestAppColour.primaryPurple,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 30
        )),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            children: [
              Placeholder(),
              Placeholder()
            ],
          ),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt)),
            IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined)),
          ],)
        ]
      )



    );
  }



}
