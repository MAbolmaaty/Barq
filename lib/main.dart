import 'file:///C:/MU/barq/lib/src/utils/localization/app_locale.dart';
import 'package:barq/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  //runApp(DevicePreview(builder: (context) => App()));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((instance) {
    String lang = instance.getString('Locale');
    print(lang);
    runApp(App(lang));
  });

}

class App extends StatefulWidget {
  final String lang;

  App(this.lang);

  @override
  _AppState createState() => _AppState();

}

class _AppState extends State<App>{

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppLocale(Locale(widget.lang)),
      child: Consumer<AppLocale>(builder: (context, locale, child) {
        print('locale call');
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
