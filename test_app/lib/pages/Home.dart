import 'package:flutter/material.dart';
import 'package:test_project/Theme.dart';
import 'package:test_project/pages/main_pages/Favorites.dart';
import 'package:test_project/pages/main_pages/Map.dart';
import 'package:test_project/pages/main_pages/Inbox.dart';
import 'package:test_project/pages/main_pages/Profile.dart';
import 'package:test_project/pages/main_pages/Wardrobe.dart';
import 'package:test_project/widgets/NavigationBar.dart';
import 'package:test_project/widgets/WeatherWindow.dart';
import '../widgets/image_picker.dart';

///This is the home screen, the landing page for users when they have logged in.

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 2; // This sets the selected item on the bottom navigation bar

  void _onItemTapped(int index) {
    ///This function is called when the BottomNavigationBar is tapped and an item
    ///is selected. The state is set and the current index is set to the index selected by the
    ///user.
    setState(() {
      _currentIndex = index;
    });
  }


  //This is a list of the main pages.
  final List<Widget> _pages = const [
    MyProfile(), //This is the profile page where a user can view their profile
    Map(),//This is the map page, where a user can view their location and nearby services
    HomePage(), //This is the home page which will contain all the key information
    Favorites(), // This is the favorites page where a user can view their favorite outfits
    Inbox(), // This is the inbox page where a user can view their messages
  ];


  @override
  Widget build(BuildContext context) {
    ///The home screen is built as a scaffold with a bottom navigation bar and a body which contains
    ///a list of the main pages.
    return Scaffold(
        backgroundColor: TestAppColour.babyBlue,
        bottomNavigationBar: HomeNavigationBar(selectedIndex: _currentIndex, onNavItemSelected: _onItemTapped),
        body: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
    );
  }
}

class HomePage extends StatefulWidget {
  ///This is the home page, which will contain all the key information for the user
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: -50,
                child: SizedBox(height: 230, width: 230, child: Image(image: AssetImage('assets/app_logo_300_300.png'))),
            ),
              Positioned(
                  right: 10,
                  top: 160,
                  child: WeatherWindow()),
              ImagePickerWidget(),
            ])
      ),
        Wardrobe(),

      ]
    );
  }
}

