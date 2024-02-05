import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_project/Theme.dart';

/// Loading screen which will check if the user is logged in or not, if logged in
/// it will take them to the home page, if not it will take them to the login page

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getMaterialColor(TestAppColour.babyBlue)[100],
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
            image: AssetImage('assets/app_logo_300_300.png'),
            ),
            SizedBox(height: 50),
            SpinKitCircle(
              color: TestAppColour.primaryPurple,
              size: 70.0,
            )
          ],
        ),
        ),
    );
  }


  void loadData() async{
    ///This function will login the user to Firebase, get their wardrobe and
    ///make it into a global object and set up their UI
    ///e.g light/dark mode, themes etc


  }




}
