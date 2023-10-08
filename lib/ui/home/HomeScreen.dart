import 'package:flutter/material.dart';
import 'package:islami10/ui/MyThemeData.dart';
import 'package:islami10/ui/hadeth/HadethTab.dart';
import 'package:islami10/ui/radio/RadioTab.dart';
import 'package:provider/provider.dart';
import '../../providers/SettingsProvider.dart';
import '../quran/QuranTab.dart';
import '../settings/SettingsTab.dart';
import '../tasbeh/TasbehTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(settingsProvider.getBackgroundImage()),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_name,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
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
                  icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                  label: AppLocalizations.of(context)!.tasbeh),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings),
            ],
          ),
          body: tabs[selectedIndex]),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    TasbehTab(),
    HadethTab(),
    RadioTab(),
    SettingsTab(),
  ];
}
