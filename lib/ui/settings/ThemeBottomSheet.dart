import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami10/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: settingsProvider.isDarkEnabled() ? getUnselectedItem(AppLocalizations.of(context)!.light):
              getSelectedItem(AppLocalizations.of(context)!.light)),
          InkWell(
              onTap: (){
                settingsProvider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child:settingsProvider.isDarkEnabled() ? getSelectedItem(AppLocalizations.of(context)!.dark):
              getUnselectedItem(AppLocalizations.of(context)!.dark))
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 18, color: Theme.of(context).colorScheme.secondary),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).colorScheme.secondary,
        )
      ],
    );
  }

  Widget getUnselectedItem(String text) {
    return Row(
      children: [
        Text(text,
            style: TextStyle(
                fontSize: 18, color: Theme.of(context).colorScheme.onPrimary)),
      ],
    );
  }
}
