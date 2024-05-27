import 'package:flutter/material.dart';
import 'package:test_project/Theme.dart';
import 'package:test_project/pages/Chatbot.dart';
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
  int _currentIndex =
      2; // This sets the selected item on the bottom navigation bar

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
    Map(), //This is the map page, where a user can view their location and nearby services
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
      bottomNavigationBar: HomeNavigationBar(
          selectedIndex: _currentIndex, onNavItemSelected: _onItemTapped),
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
    return PageView(children: [
      SafeArea(
        child: Stack(children: [
          Positioned(
            left: -50,
            child: SizedBox(
                height: 230,
                width: 230,
                child: Image(image: AssetImage('assets/app_logo_300_300.png'))),
          ),
          Positioned(right: 10, top: 160, child: WeatherWindow()),
          Positioned(
            left: 1,
            bottom: 250,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  //get colors from hex
                                  Color(0xFF42A5F5), // Light Blue
                                  Color(0xFF1565C0),
                                ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 16.0, left: 16.0),
                                    child: (Text("Swerv Bot",
                                        style: const TextStyle(
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))),
                                  ),
                                  // const Padding(
                                  //   padding: EdgeInsets.only(left: 16.0),
                                  //   child: (Text("Anything",
                                  //       style: const TextStyle(
                                  //           fontSize: 20.0,
                                  //           fontWeight: FontWeight.bold,
                                  //           color: Colors.white))),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 16.0, bottom: 16.0),
                                    child: (TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChatScreen()),
                                          );
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.black),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: GradientText(
                                            text: "Sign Up",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            gradient: LinearGradient(colors: [
                                              Color(0xFF42A5F5), // Light Blue
                                              Color(0xFF1565C0), // Blue
                                            ]),
                                          ),
                                        ))),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0),
                                child: Icon(Icons.chat,
                                    color: Colors.white, size: 100.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
      Wardrobe(),
    ]);
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  GradientText({
    required this.text,
    required this.style,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
