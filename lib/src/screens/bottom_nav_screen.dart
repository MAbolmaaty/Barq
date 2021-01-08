
import 'package:barq/src/screens/main_screen.dart';
import 'package:barq/src/screens/notifications_screen.dart';
import 'package:barq/src/screens/profile_screen.dart';
import 'package:barq/src/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget{
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => BottomNavScreen(),
  );

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen>{
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: _currentIndex,
          children: [
            MainScreen(),
            NotificationsScreen(),
            ProfileScreen(),
            SettingsScreen(),
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),label: "" ),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "" ),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
          ]),
    );
  }
}