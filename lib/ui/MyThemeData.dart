
import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightPrimary =  Color(0xFFB7935F);
  static const Color darkPrimary =  Color(0xFF141A2E);
  static const Color darkSecondary =  Color(0xFFFACC1D);

  static ThemeData lightTheme  = ThemeData(
    cardTheme: CardTheme(
      color: Colors.white
    ),
    dividerColor: lightPrimary,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 20 ,
        fontWeight: FontWeight.w400,
        color: Colors.black
      ),
          headlineSmall: TextStyle(
        fontSize: 25 ,
            fontWeight: FontWeight.w600,
            color: Colors.black
    )
    ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: lightPrimary,
        selectedLabelStyle: TextStyle(fontSize:16 , color: Colors.black),
        unselectedLabelStyle: TextStyle(fontSize: 12 , color: Colors.white)
        ,selectedIconTheme: IconThemeData(size: 26),
        unselectedIconTheme: IconThemeData(size: 25),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,

      ),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(

          seedColor: lightPrimary,
          primary: lightPrimary,
          secondary: lightPrimary,
          onPrimary: Colors.black87,
          onSecondary: Colors.black87).copyWith(background: lightPrimary),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData( color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 28),
          shadowColor: Colors.transparent));


   static ThemeData darkTheme = ThemeData(
     cardTheme: CardTheme(color: darkPrimary),
     dividerColor: darkSecondary,
     bottomSheetTheme: BottomSheetThemeData(
       backgroundColor: MyThemeData.darkPrimary ,
     ),
       textTheme: const TextTheme(
           bodySmall: TextStyle(
               fontSize: 20 ,
               fontWeight: FontWeight.w400,
               color: Colors.white
           ),
           headlineSmall: TextStyle(
               fontSize: 25 ,
               fontWeight: FontWeight.w600,
               color: Colors.white
           )
       ),
     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(fontSize:16 , color: Colors.black),
        unselectedLabelStyle: TextStyle(fontSize: 12 , color: Colors.white)
        ,selectedIconTheme: IconThemeData(size: 26),
        unselectedIconTheme: IconThemeData(size: 25),
        selectedItemColor: darkSecondary,
        unselectedItemColor: Colors.white,

      ),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData( color: Colors.white),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 28),
          shadowColor: Colors.transparent), colorScheme: ColorScheme.fromSeed(
          seedColor: darkPrimary,
          primary: darkPrimary,
          secondary: darkSecondary,
          onPrimary: Colors.white,
          onSecondary: Colors.black87).copyWith(background: darkPrimary));

}