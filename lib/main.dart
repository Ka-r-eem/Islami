import 'package:flutter/material.dart';
import 'package:islami10/splashScreen.dart';
import 'package:islami10/ui/ChapterDetails/ChapterDetailsScreen.dart';
import 'package:islami10/ui/HadethDetails/HadethDetailsScreen.dart';
import 'package:islami10/ui/home/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Islami",
      theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedLabelStyle: TextStyle(fontSize:16 , color: Colors.black),
            unselectedLabelStyle: TextStyle(fontSize: 12 , color: Colors.white)
            ,selectedIconTheme: IconThemeData(size: 26),
            unselectedIconTheme: IconThemeData(size: 25),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,

          ),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFFB7935F),
              primary: const Color(0xFFB7935F),
              secondary: const Color(0xB0B7935F),
              onPrimary: Colors.white,
              onSecondary: Colors.black),
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData( color: Colors.black),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 28),
              shadowColor: Colors.transparent)),

      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        ChapterDetailsScreen.routeName : (_)=>ChapterDetailsScreen(),
        HadethDetailsScreen.routeName : (_)=>HadethDetailsScreen(),
        splashScreen.routeName : (_)=>splashScreen(),

      },
      initialRoute: splashScreen.routeName,
    );
  }
}
