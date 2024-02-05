import 'package:flutter/material.dart';
import 'package:test_project/Theme.dart';

class HomeNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onNavItemSelected;


  const HomeNavigationBar({super.key, required this.selectedIndex, required this.onNavItemSelected});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  int _selectedIndex = 0; // Sets the selected item


  static const List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    BottomNavigationBarItem(icon: Icon(Icons.location_pin), label: 'Map'),
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Inbox'),
  ];


  void onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onNavItemSelected(index);
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 2;
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        backgroundColor: TestAppColour.primaryBlue,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: (index) {
          onNavItemTapped(index);
        },
        items: _navItems.map((item) {
          return item;
        }).toList()
    );
  }
}

class NavItem {
  IconData icon;
  String title;

  NavItem(this.icon, this.title);
}
