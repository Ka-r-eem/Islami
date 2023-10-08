import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami10/providers/SettingsProvider.dart';
import 'package:islami10/splashScreen.dart';
import 'package:islami10/ui/ChapterDetails/ChapterDetailsScreen.dart';
import 'package:islami10/ui/HadethDetails/HadethDetailsScreen.dart';
import 'package:islami10/ui/MyThemeData.dart';
import 'package:islami10/ui/home/HomeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(

      create: (buildContext) => SettingsProvider()
      ,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      title: "Islami",
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: settingsProvider.currentTheme,

      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
        splashScreen.routeName: (_) => splashScreen(),

      },
      initialRoute: splashScreen.routeName,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(settingsProvider.currentLocale),
    );
  }
}
