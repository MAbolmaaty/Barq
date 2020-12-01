
import 'package:barq/src/screens/main_screen.dart';
import 'package:barq/src/screens/notifications_screen.dart';
import 'package:barq/src/screens/profile_screen.dart';
import 'package:barq/src/screens/settings_screen.dart';
import 'package:flutter/widgets.dart';

class BottomNavItem{
  final Widget screen;
  final String title;
  BottomNavItem({@required this.screen, @required this.title,});

  static List<BottomNavItem> get allItems => [
    BottomNavItem(screen : MainScreen(), title : 'Main'),
    BottomNavItem(screen : NotificationsScreen(), title : 'Notifications'),
    BottomNavItem(screen : ProfileScreen(), title : 'Profile'),
    BottomNavItem(screen : SettingsScreen(), title : 'Settings'),
  ];
}

