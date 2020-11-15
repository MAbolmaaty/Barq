import 'package:barq/src/screens/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  //runApp(DevicePreview(builder: (context) => App()));
  runApp(App());
}

class App extends StatelessWidget {
  static const AccentColor = const Color(0xFF333333);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange),
      home: SplashScreen(),
      // routes: {
      //   LoginScreen.route: (context) => LoginScreen(),
      //   RegisterScreen.route: (context) => RegisterScreen(),
      // },
    );
  }
}
