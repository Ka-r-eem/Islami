import 'package:flutter/material.dart';
import 'package:islami10/ui/hadeth/HadethTab.dart';
import 'package:islami10/ui/radio/RadioTab.dart';
import '../quran/QuranTab.dart';
import '../tasbeh/TasbehTab.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/main_background.png"),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Islami'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Color(0xFFB7935F),
                icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                label: "Quran"),
            BottomNavigationBarItem(
                backgroundColor: Color(0xFFB7935F),
                icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                label: "Sebha"),
            BottomNavigationBarItem(
                backgroundColor: Color(0xFFB7935F),
                icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                label: "Hadeth"),
            BottomNavigationBarItem(
                backgroundColor: Color(0xFFB7935F),
                icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                label: "Radio"),
          ],
        ),
      body: tabs[selectedIndex]
      ),
    );
  }
  List<Widget>tabs =[
    QuranTab(),
    TasbehTab(),
    HadethTab(),
    RadioTab(),
  ];
}
