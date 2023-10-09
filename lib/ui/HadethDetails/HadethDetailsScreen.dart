import 'package:flutter/material.dart';
import 'package:islami10/ui/MyThemeData.dart';
import 'package:islami10/ui/hadeth/Hadeth.dart';
import 'package:provider/provider.dart';

import '../../providers/SettingsProvider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "Hadeth_Details";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                settingsProvider.getBackgroundImage()),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title , style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        ),
        body: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 30,
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: SingleChildScrollView(
                  child: Text(
                    args.Content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.secondary,
                      fontFamily:"JF Flat regular"
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
