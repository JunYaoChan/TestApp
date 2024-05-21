import 'package:flutter/material.dart';
import 'package:test_project/pages/Loading.dart';
import 'package:test_project/pages/Home.dart';


//This is the main function and will be run when the app starts
void main() => runApp(
    MaterialApp(
      //Set entire app theme
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      //Creates new material app with initial route as '/'
      // '/' is the loading screen where we will check users' authentication status.
      initialRoute: '/home', // Initial route, change to '/' when debugging
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
      },
    ));
