
import 'package:barq/src/models/bottom_nav_item.dart';
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
            BottomNavItem.allItems[0].screen,
            BottomNavItem.allItems[1].screen,
            BottomNavItem.allItems[2].screen,
            BottomNavItem.allItems[3].screen,
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
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), title: Text("")),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("")),
            BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text(""))
          ]),
    );
  }
}