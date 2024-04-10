import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hack/screens/Community_screen.dart';
import 'package:hack/screens/Remainder_screen.dart';
import 'package:hack/screens/Voice%20Screen.dart';
import 'package:hack/screens/home.dart';

void main() {
  runApp(MaterialApp(
    home: BottomNavBarExample(),
  ));
}

class BottomNavBarExample extends StatefulWidget {
  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Home_Screen(),
    Voice_screen(),
    Community_screen(),
    Remainder_screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigoAccent,
        leading:Container(
           // decoration: BoxDecoration(
           //   border: Border.all(
           //   // color: Colors.white, // Border color
           //   width: 4, // Border thickness
           // ),
           //   borderRadius: BorderRadius.circular(80), // Adjust the value as needed
           // ),
            child: Icon(Icons.person, color: Colors.white)),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15), // Adjust the value as needed
            ),
            child: IconButton(
              icon: Icon(Icons.warning, color: Colors.red, size: 32,),
              onPressed: () {
                // Handle emergency button press
                // Add your emergency action here
                print('Emergency button pressed!');
              },
            ),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.indigoAccent,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.mic,
                  text: 'Voice',
                ),
                GButton(
                  icon: Icons.group,
                  text: 'Community',
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Remainder',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

