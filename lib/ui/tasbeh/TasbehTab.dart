import 'package:flutter/material.dart';
import 'package:islami10/providers/SettingsProvider.dart';
import 'package:islami10/ui/MyThemeData.dart';
import 'package:provider/provider.dart';

class TasbehTab extends StatefulWidget {
  int tasbeehNum = 0;
  double RotateAngle = 0;
  bool reset = false;

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int index = 0;

  List<String> Doaa = [
    "سبحان الله",
    "الحمدلله",
    "الله أكبر",
    "لا اله الا الله"
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            alignment: Alignment.center,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 50),
                    child:  Image(
                        image: AssetImage(
                            settingsProvider.currentTheme == ThemeMode.dark ? "assets/images/head_sebha_dark.png":
                            "assets/images/head_sebha_logo.png"))),
                Container(
                    margin: const EdgeInsets.only(top: 75),
                    child: Transform.rotate(
                      angle: widget.RotateAngle,
                      child:  Image(
                          image: AssetImage(
                              settingsProvider.currentTheme == ThemeMode.dark ? "assets/images/body_sebha_dark.png":
                              "assets/images/body_sebha_logo.png")),
                    )),
              ],
            ),
          ),
           Text(
            "عدد التسبيحات",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold , color: Theme.of(context).colorScheme.onPrimary),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor),
            width: 70,
            height: 80,
            child: Center(
                child: Text(
              "${widget.tasbeehNum}",
              style:  TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary),
            )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: ElevatedButton(
                onPressed: () {
                  widget.reset = true;
                  if (index > 4) {
                    index = 0;
                  } else {
                    widget.tasbeehNum++;
                    DoaaChange(widget.tasbeehNum);
                    widget.RotateAngle += 2;
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Text(
                  Doaa[index],
                  style:  TextStyle(fontSize: 25, color: Theme.of(context).colorScheme.onSecondary),
                )),
          ),
          Visibility(
            visible: widget.reset ,
            child: ElevatedButton(
                onPressed: () {
                  widget.tasbeehNum = 0;
                  index = 0;
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB7935F),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  "RESET",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }

  void DoaaChange(num) {
    if (num % 33 == 0) {
      index++;
    }
  }
}
