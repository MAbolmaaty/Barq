import 'package:barq/app_locale.dart';
import 'package:barq/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(DevicePreview(builder: (context) => App()));
  runApp(App());
}

class App extends StatelessWidget {
  static const AccentColor = const Color(0xFF333333);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppLocale(),
      child: Consumer<AppLocale>(builder: (context, locale, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale.locale,
          theme: ThemeData(primaryColor: Colors.orange),
          home: SplashScreen(),
        );
      }),
    );
  }
}
